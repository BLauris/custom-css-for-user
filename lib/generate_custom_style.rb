class GenerateCustomStyle

  attr_reader :custom_style

  def initialize(style_id) 
    @custom_style = Style.find(style_id)
  end

  def compile
    file = File.new(File.join(tmp_themes_path, "#{filename}.scss"), "w")

    begin
      file.write generate_css
      file.flush
      custom_style.css = file
      custom_style.save
    ensure
      file.close
    end
  end

  private

  def filename
    "#{custom_style.user_id}"
  end
    
  def tmp_themes_path
    @tmp_themes_path ||= File.join(Rails.root, 'tmp', 'generate_css')
    FileUtils.mkdir_p(@tmp_themes_path) unless File.exists?(@tmp_themes_path)
    @tmp_themes_path
  end

  def create_asset
    body = ERB.new(File.read(File.join(Rails.root, 'app', 'assets', 'stylesheets', '_template.scss.erb'))).result(binding)

    File.delete(File.join(tmp_themes_path, "#{filename}.scss")) if File.exists?(File.join(tmp_themes_path, "#{filename}.scss"))
    File.open(File.join(tmp_themes_path, "#{filename}.scss"), 'w') { |f| f.write(body) }
    # binding.pry
    # env = if Rails.application.assets.is_a?(Sprockets::Index)
    #   Rails.application.instance_variable_get('@assets_manifest').instance_variable_get('@environment')
    # else
      env = Rails.application.assets
    # end
    # File.binread(file)
    env.find_asset(filename)
  end

  def generate_css
    Sass::Engine.new(create_asset.source, {
      syntax: :scss,
      cache: false,
      read_cache: false,
      style: :compressed
    }).render
  end

end