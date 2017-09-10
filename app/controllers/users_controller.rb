class UsersController < ApplicationController
  def new
    @user= User.new
  end

  def create
    @User = Picture.new



     if @userr.save
       # if the picture gets saved, generate a get request to "/pictures" (the index)
       redirect_to "/pictures"
     else
       # otherwise render new.html.erb
       render :new
     end
  end
end
