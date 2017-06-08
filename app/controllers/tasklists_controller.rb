class TasklistsController < ApplicationController
  def index
    @tasklists = Tasklist.all
  end

  def show
    @tasklist = Tasklist.find(params[:id])
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
    @tasklist = Tasklist.find(params[:id])
  end

  def update
    @tasklist = Tasklist.find(params[:id])
    
    if @tasklist.update(tasklist_params)
      flash[:success] = "Tasklistは正常に更新されました"
      redirect_to @tasklist
    else
      flash.now[:danger] = "Tasklistは更新されました"
      render :edit
    end
  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy
    
    flash[:success] = "Tasklistは正常に削除されました"
    redirect_to tasklists_url
  end
end

  def tasklist_params
    params.require(:tasklist).permit(:content)
  end