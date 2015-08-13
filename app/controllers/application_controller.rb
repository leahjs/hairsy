class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?, :add_user_id
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def add_user_id
    if signed_in?
      params[params[:controller].singularize][:user_id] = current_user.id
    end
  end
end
