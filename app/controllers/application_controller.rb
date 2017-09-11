class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def ensure_logged_in
  unless current_user
    flash[:alert] = "Please log in"
    redirect_to new_sessions_url
  end
end

def ensure_user_owns_picture
  unless current_user == @picture.user
  flash[:notice] = "you are not authorized to view this page"
  redirect_to root_url
  end
end


  private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

helper_method :current_user

end
