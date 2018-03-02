class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id 
      redirect_to root_path, notice: 'You have successfully created a new account'
    else
      redirect_to new_user_path, notice: 'Something went wrong. Please try again'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
