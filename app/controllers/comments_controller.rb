class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
