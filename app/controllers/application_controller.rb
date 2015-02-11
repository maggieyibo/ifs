class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Removes serializer root
  def default_serializer_options
    { root: false }
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  helper_method :current_user

  def authorize
    redirect_to signup_path unless current_user
  end

end
