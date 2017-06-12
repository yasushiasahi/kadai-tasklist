class TasksController < ApplicationController
  before_action :set_selected_id,only:[:edit,:show,:update,:destroy]
  
  def index
    @all_tasks = Task.all
  end
  
  def create
    @task = Task.new(params_task)
    result = @task.save
    move_to_index_with_display_flash(result,:new,"作成")
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
    move_to_index_with_display_flash(result,:edit,"変更")
  end
  
  def destroy
    result = @task.destroy
    move_to_index_with_display_flash(result,:show,"削除")
  end
  
  #============================================#
  private
  
  def move_to_index_with_display_flash(result,where_you_were,cud)
    if result
      flash[:success] = "タスクが正常に" + cud + "されました"
      redirect_to "/"
    else
      flash[:danger] = "タスクの" + cud + "に失敗しました"
      render where_you_were
    end
  end
  
  def set_selected_id
    @task = Task.find(params[:id])
  end
  
  def params_task
    params.require(:task).permit(:content,:status)
  end
  #============================================#
  
end
