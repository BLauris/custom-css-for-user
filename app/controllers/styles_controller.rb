class StylesController < ApplicationController

  def index

  end

  def new
    @style = current_user.styles.new
  end

  def create
    @style = current_user.styles.new(style_params)
    if @style.save
      generate_stylesheet = GenerateCustomStyle.new(@style.id)
      generate_stylesheet.compile
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def style_params
    params.require(:style).permit(:logo, :background_color, :font_color, :font_style, :font_size)
  end

end
