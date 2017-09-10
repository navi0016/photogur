
class SessionsController < ApplicationController
  def new
  end

def create
  user = User.find_by(email: params[:sessions][:email])

  if user && user.authenticate(params[:sessions][:password])


    session[:user_id] = user.id
    flash[:notice] =  "Logged in!"
    redirect_to root_url
  else
    flash[:notice] = "Your email or password may be incorrect"
    render :new
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, notice: "Logged out!"
end


end
