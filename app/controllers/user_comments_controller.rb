class UserCommentsController < ApplicationController
  def create
    @new_comment = UserComment.new(comment_params)
    @new_comment.author_id = current_user.id
    if @new_comment.save
      redirect_to user_goals_url(@new_comment.user_id)
    else
      flash[:errors] = "cant make that comment"
      redirect_to user_goals_url(@new_comment.user_id)
    end
  end
  def comment_params
    params.require(:comment).permit(:body,:user_id)
  end
end
