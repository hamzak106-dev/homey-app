class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @project, notice: "Comment added successfully."
    else
      redirect_to @project, alert: "Failed to add comment."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.project, notice: "Comment deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end