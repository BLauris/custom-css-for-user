class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :current_style

  private

  def current_user
    @current_user ||= User.last
  end

  def current_style
    @current_style ||= @current_user.styles.last
  end

end
