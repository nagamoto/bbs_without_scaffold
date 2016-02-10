class MyThreadsController < ApplicationController
  before_action :set_my_thread, only: [:show, :edit, :update, :destroy]

  def index
    @my_threads = MyThread.all
  end

  def show
    @my_comments = MyComment.where(my_thread_id: params['id'])
  end

  def new
    @my_thread = MyThread.new
  end

  def edit
  end

  def create
    @my_thread = MyThread.new(my_thread_params)
    if @my_thread.save
      render :show, location: @my_thread
      return
    end
    render :new, location: @my_thread
  end

  def update
    if @my_thread.update(my_thread_params)
      redirect_to my_thread_path(@my_thread)
#      render :show, location: @my_thread
      return
    end
    render :edit, location: @my_thread
  end

  def destroy
    if @my_thread.destroy
      redirect_to my_threads_path
      return
    end
    render :edit, location: @my_thread
  end

  private

    def set_my_thread
      return unless params[:id]
      @my_thread = MyThread.find(params[:id])
    end

    def my_thread_params
      params.require(:my_thread).permit(:title, :overview)
    end

end
