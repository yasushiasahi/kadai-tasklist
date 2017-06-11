class TasksController < ApplicationController
  def index
    @all_tasks = Task.all
  end
  
  def create
    new_task = Task.new(params_task)
    
    if new_task.save
      flash[:success] = "タスクが正常に作成されました"
      redirect_to Task
    else
      flash[:success] = "タスクの作成に失敗しました"
      render task
    end
  end
  
  def new
    @new_task = Task.new
  end
  
  def edit
    @edit_task = Task.find(params[:id])
  end
  
  def show
    @show_task = Task.find(params[:id])
  end
  
  def update
    update_task = Task.find(params[:id])
    
    if update_task.update(params_task)
      flash[:success] = "タスクが正常に更新されました"
      redirect_to Task
    else
      flash[:success] = "タスクの更新に失敗しました"
      render task
    end
  end
  
  def destroy
    @destroy_task = Task.find(params[:id])
    
    if @destroy_task.destroy
      flash[:success] = "タスクが正常に削除されました"
      redirect_to Task
    else
      flash[:success] = "タスクの削除に失敗しました"
      render task
    end
  end
  
  private
  
  def params_task
    params.require(:task).permit(:content)
  end
  
end
