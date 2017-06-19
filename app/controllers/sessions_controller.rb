class SessionsController < ApplicationController
  def new
  end

  def create
    login
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  private
  
  def login
    email = params[:session][:email]
    password = params[:session][:password]
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
    else
      render :new
    end
  end
  
  
end
