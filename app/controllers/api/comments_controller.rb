class Api::CommentsController < ApplicationController
  def show
    render json: Comment.find(params[:id])
  end

  def index
    render json: Comment.all
  end

  def create
    comment = Comment.new
    comment.parent_comment_id = params[:comment][:parent_comment_id]
    if params[:comment][:child_comment_ids]
      comment.child_comment_ids = params[:comment][:child_comment_ids]
    end
    comment.user_id = params[:comment][:user_id]
    comment.video_id = params[:comment][:video_id]
    comment.content = Sanitize.clean(params[:comment][:content], Sanitize::Config::BASIC)
    if comment.save! && user_signed_in? && current_user == comment.user
      render json: comment
    else
      render json: comment.errors
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update_attributes(comment_params)
    if comment.save! && user_signed_in? && current_user == comment.user
      render json: comment
    else
      render json: comment.errors
    end
  end

private

  def comment_params
    if params[:comment]
      params.require(:comment).permit!
    end
  end
end
