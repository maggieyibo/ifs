class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Check to see if user parameters are valid and are saved

    if @user.valid? && @user.save
      redirect_to main_path
    else
      render :new
    end

  end

  # Parameters required to create a new user
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
