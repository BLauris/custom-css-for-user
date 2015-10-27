class GenerateCustomStyle
  attr_reader :style, :stylesheet

  def initialize(style_id)
    @style = Style.find(style_id)
    @stylesheet = UserStylesheet.new(params)
  end

  def compile
    css = stylesheet.compile
    style.update(css: css)
    File.delete(css.path)
  end

  private

  def params
    {
      env: Rails.application.assets,
      scss_variables:
      {
        background_color: style.background_color,
        font_color: style.font_color,
        font_size: style.font_size,
        font_style: style.font_style
      },
      file_info:
      {
        file_name: "#{style.user_id}_#{style.updated_at.to_i}",
        template_file_path: 'app/assets/stylesheets/_template.scss.erb',
        tmp_dir: 'tmp/generate_css'
      }
    }
  end
end
