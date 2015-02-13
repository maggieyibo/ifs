class SessionsController < ApplicationController

  def new
  end

  def create

    # Finds User with email
    user = User.find_by(email: params[:user][:email])

    # Check to see if user exists and is authenticated with password

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to main_path

    # Render new if the login information is incorrect
    
    else
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
