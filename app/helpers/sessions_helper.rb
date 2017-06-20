module SessionsHelper
   
  def current_user
    if @current_user
      return @current_user
    else
      @current_user = User.find_by(id: session[:user_id])
      return @current_user
    end
  end
  
  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end
  
  def number_of_incompleted_tasks
    incompleted_tasks = current_user.tasks.where(status: ["未着手","進行中"]).count
    if incompleted_tasks > 0
      return incompleted_tasks.to_s + "個が未完了にござる。"
    else
      return "未完了のタスクはござらぬ。"
    end
  end
  
  def number_of_completed_tasks
    completed_tasks = current_user.tasks.where(status: ["未着手","進行中"]).count
    if completed_tasks > 0
      return "完了済のタスクはござらぬ。"
    else
      return "ご苦労であった。"
    end
  end
end
