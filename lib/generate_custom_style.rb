class GenerateCustomStyle

  attr_reader :custom_style, :body, :env, :filename, :file

  def initialize(style_id) 
    @custom_style = Style.find(style_id)
    @filename = "#{custom_style.user_id}"
    @file = File.new(File.join(tmp_themes_path, "#{filename}.scss"), "w")
    @body = ERB.new(File.read(File.join(Rails.root, 'app', 'assets', 'stylesheets', '_template.scss.erb'))).result(binding)
    @env = Rails.application.assets
  end

  def compile
    create_temporary_file

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

  def create_temporary_file
    File.open(File.join(tmp_themes_path, "#{filename}.scss"), 'w') { |f| f.write(body) }
  end
    
  def tmp_themes_path
    @tmp_themes_path ||= File.join(Rails.root, 'tmp', 'generate_css')
    FileUtils.mkdir_p(@tmp_themes_path) unless File.exists?(@tmp_themes_path)
    @tmp_themes_path
  end

  def generate_css
    Sass::Engine.new(env.find_asset(filename).source, {
      syntax: :scss,
      cache: false,
      read_cache: false,
      style: :compressed
    }).render
  end

end