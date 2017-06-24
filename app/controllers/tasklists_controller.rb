class TasklistsController < ApplicationController
  before_action :set_tasklist, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:index, :new, :show, :edit, :destroy]
#  before_action :correct_user, only: [:show, :edit, :destroy]

  def index
    if logged_in?
      @user = current_user
      @tasklists = current_user.tasklists.order('created_at DESC').page(params[:page])
    end
  end

  def show
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = current_user.tasklists.build(tasklist_params)
    
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

    def tasklist_params
    params.require(:tasklist).permit(:content, :status)
    end
    
  def set_tasklist
    @tasklist = Tasklist.find(params[:id])
  end

#  def correct_user
#   @tasklist = current_user.tasklists.find_by(id: params[:id])
#   unless @tasklist
#      render tasklists_url
#   end
#  end
end