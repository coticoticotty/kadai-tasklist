class TasklistsController < ApplicationController
  before_action :set_tasklist, only: [:show, :edit, :update, :destroy]
  def index
    @tasklists = Tasklist.all
  end

  def show
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)
    
    if @tasklist.save
      flash[:success] = "Tasklistが正常に投稿されました"
      redirect_to @tasklist
    else
      flash.now[:danger] = "Tasklistが投稿されませんでした"
      render :new
    end
  end

  def edit
  end

  def update

    if @tasklist.update(tasklist_params)
      flash[:success] = "Tasklistは正常に更新されました"
      redirect_to @tasklist
    else
      flash.now[:danger] = "Tasklistは更新されました"
      render :edit
    end
  end

  def destroy
    @tasklist.destroy
    
    flash[:success] = "Tasklistは正常に削除されました"
    redirect_to tasklists_url
  end

  private
  
  def set_tasklist
    @tasklist = Tasklist.find(params[:id])
  end
  
  def tasklist_params
    params.require(:tasklist).permit(:content, :status)
  end
end