class UsersController < ApplicationController
  
  def show
    require_user_logged_in
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "アカウントを作成しました。ログインして下さい。"
      redirect_to login_url
    else
      flash[:danger] = "アカウント作成に失敗しました。"
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  

end
