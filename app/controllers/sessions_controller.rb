class SessionsController < ApplicationController
  
  def new
    if logged_in?
      @incompleted_tasks = current_user.tasks.where(status: ["未着手","進行中"])
      @completed_tasks = current_user.tasks.where(status: ["完了","完了と見せかけて放棄"])
    end
  end

  def create
    if login
      flash[:success] = "ログインしました。"
      redirect_to root_url
    else
      flash[:danger] = "ログインできませんでした。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] =  "ログアウトしました。(屮´､ゝ`)屮 ｿｸｻｲﾃﾞﾅ"
    redirect_to root_path
  end
  
  private
  
  def login
    email = params[:session][:email]
    password = params[:session][:password]
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
  
  
end
