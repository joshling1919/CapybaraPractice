class GoalCommentsController < ApplicationController
  def create
    @new_comment = GoalComment.new(comment_params)
    @new_comment.author_id = current_user.id
    if @new_comment.save
      redirect_to goal_url(@new_comment.goal_id)
    else
      flash[:errors] = "cant make that comment"
      redirect_to goal_url(@new_comment.goal_id)
    end
  end

  def comment_params
    params.require(:comment).permit(:body,:goal_id)
  end
end
