class MyCommentsController < ApplicationController
  before_action :set_my_comment, only: [:show, :edit, :update, :destroy]

  def new
    @my_comment = MyComment.new
    @my_thread_id = params[:my_thread_id]
  end

  def edit
    @my_thread_id = @my_comment.my_thread_id
  end

  def create
    @my_comment = MyComment.new(my_comment_params)
    @my_thread_id = @my_comment.my_thread_id
    #上記にいずれuser_idを渡す
    if @my_comment.save
      redirect_to controller: 'my_threads', action: 'show', id: @my_thread_id
      return
    end
    render :new, location: @my_comment
  end

  def update
    @my_thread_id = @my_comment.my_thread_id
    if @my_comment.update(my_comment_params)
      redirect_to controller: 'my_threads', action: 'show', id: @my_thread_id
      return
    end
    render :edit, location: @my_comment
  end

  def destroy
    @my_thread_id = @my_comment.my_thread_id
    if @my_comment.destroy
      redirect_to controller: 'my_threads', action: 'show', id: @my_thread_id
      return
    end
    #flash で一時的なメッセージを作成したほうがよい
    redirect_to controller: 'my_threads', action: 'show', id: @my_thread_id
  end

  private

    def set_my_comment
      return unless params[:id]
      @my_comment = MyComment.find(params[:id])
    end

    def my_comment_params
      params.require(:my_comment).permit(:overview, :my_thread_id)
    end

end
