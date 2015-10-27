class GenerateCustomStyle

  attr_reader :custom_style, :body, :env, :filename, :file

  def initialize(style_id)
    @custom_style = Style.find(style_id)
    @filename = "#{custom_style.user_id}_#{custom_style.updated_at.to_i}"
    @file = File.new(scss_file, 'w')
    @body = ERB.new(File.read(template_file_path)).result(binding)
    @env = Rails.application.assets
  end

  def compile
    find_or_create_scss

    begin
      file.write generate_css
      file.flush
      custom_style.update(css: file)
    ensure
      file.close
      File.delete(file)
    end
  end

  private

  def template_file_path
    @template_file_path ||= File.join(Rails.root, 'app', 'assets', 'stylesheets', '_template.scss.erb')
  end

  def scss_file_path
    @scss_file_path ||= File.join(Rails.root, 'tmp', 'generate_css')
    FileUtils.mkdir_p(@scss_file_path) unless File.exists?(@scss_file_path)
    @scss_file_path
  end

  def scss_file
    @scss_file ||= File.join(scss_file_path, "#{filename}.scss")
  end

  def find_or_create_scss
    File.open(scss_file, 'w') { |f| f.write(body) }
  end

  def generate_css
    Sass::Engine.new(asset_source, {
      syntax: :scss,
      cache: false,
      read_cache: false,
      style: :compressed
    }).render
  end

  def asset_source
    if env.find_asset(filename)
      env.find_asset(filename).source
    else
      uri = Sprockets::URIUtils.build_asset_uri(file.path, type: "text/css")
      asset = Sprockets::UnloadedAsset.new(uri, env)
      env.load(asset.uri).source
    end
  end
end
