class CommentsController < ApplicationController

  before_filter :require_sign_in!
  
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to post_url(@comment.post_id)
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    redirect_to post_url(@comment.post_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
