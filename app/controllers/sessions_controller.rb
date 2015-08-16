class SessionsController < ApplicationController
  before_action :only => [:new] do
    if signed_in?
      redirect_to user_path(@current_user)
    end
  end

  def new
  end

  def create
    found_user = User.find_by_email(session_params[:email].downcase!)

    if found_user && found_user.authenticate(session_params[:password])
      session[:user_id] = found_user.id
      redirect_to user_path(found_user)
    else
      if User.find_by_email(session_params[:email]) == nil
        flash[:error] = 'Email is not associated with any account'
      else
        flash[:error] = 'Invalid email or password' # Not quite right!
      end
        redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end

private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end