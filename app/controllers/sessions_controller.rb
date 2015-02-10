class SessionsController < ApplicationController

  def new
  end

  def create

    # Finds User with email
    user = User.find_by(email: params[:user][:email])

    # Check to see if user exists and is authenticated with password

    if user && user.authenticate(parmas[:user][:password])
      redirect_to search_path

    # Render new if the login information is incorrect
    
    else
      render :new
    end

  end

end
