class StylesController < ApplicationController

  def index

  end

  def edit
    @style ||= current_user.styles.find(params[:id])
  end

  def update
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
    params.require(:style).permit(:background_color, :block_height, :name_color, 
                                  :name_style, :name_size, :text_color, :text_style, 
                                  :text_size, :email_color, :email_style, :email_size, :logo)
  end

end
