class TasksController < ApplicationController
  before_action :set_selected_id,only:[:edit,:show,:update,:destroy]
  
  def index
    @all_tasks = Task.all
  end
  
  def create
    new_task = Task.new(params_task)
    result = new_task.save
    move_to_index_with_display_flash(result)
  end
  
  def new
    @task = Task.new
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    result = @task.update(params_task)
    move_to_index_with_display_flash(result)
  end
  
  def destroy
    result = @task.destroy
    move_to_index_with_display_flash(result)
  end
  
  #============================================#
  private
  
  def move_to_index_with_display_flash(result)
    if result
      flash[:success] = "タスクが正常に作成されました"
      redirect_to Task
    else
      flash[:success] = "タスクの作成に失敗しました"
      render tasks
    end
  end
  
  def set_selected_id
    @task = Task.find(params[:id])
  end
  
  def params_task
    params.require(:task).permit(:content)
  end
  #============================================#
  
end
