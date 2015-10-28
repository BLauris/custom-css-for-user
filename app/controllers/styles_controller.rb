class StylesController < ApplicationController
  before_action :style, only: [:edit, :update]

  def index

  end

  def edit
    
  end

  def update
    generate_stylesheet = GenerateCustomStyle.new(@style.id)
    if @style.update_attributes(style_params)
      generate_stylesheet.compile
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def style_params
    params.require(:style).permit(:logo, :background_color, :font_color, :font_style, :font_size, :logo)
  end

  def style
    @style ||= current_user.styles.find(params[:id])
  end

end
