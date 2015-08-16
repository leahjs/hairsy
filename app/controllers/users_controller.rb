class UsersController < ApplicationController
  before_action :require_signin, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    if missing_signup_params?
      redirect_to signup_path
      flash[:error] = 'Please fill out all required feilds. ' # Not quite right!
    else
      if member_already? || username_taken?
        flash[:error] = 'This email is already registered.' # Not quite right!
        if username_taken?
           flash[:error] += ' Username is taken'
        end
        redirect_to signup_path
      else
        new_user = User.create(signup_params)
        session[:user_id] = new_user.id
        redirect_to user_path(new_user) if new_user
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    user = User.find(current_user)
    user.update(user_params)
    flash[:notice] = 'Profile Updated.' # Not quite right!
    redirect_to edit_user_path
  end

  def destroy
    # @user.destroy
  end

  private
    def signup_params
      params.require(:user).permit(:username, :email, :password)
    end

    def user_params
      params.require(:user).permit(:photo, :first_name, :last_name, :gender, :birth_year, :size, :country)
    end

    def member_already?
      !!(User.find_by_email(user_params[:email]))
    end

    def username_taken?
      !!(User.find_by_username(user_params[:username]))
    end

    def missing_signup_params?
      signup_params[:email].blank? || signup_params[:password].blank? || signup_params[:username].blank?
    end

end