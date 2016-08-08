class GoalsController < ApplicationController

  before_action :ensure_logged_in
  
  def index
    if params[:user_id].nil?
      @goals = Goal.all
    else
      user = User.find(params[:user_id].to_i)
      @goals = user.goals
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
  end


  def create
    @new_goal = Goal.new(goal_params)
    @new_goal.author_id = current_user.id
    if @new_goal.save
      redirect_to goal_url(@new_goal)
    else
      flash.now[:errors] = @new_goal.errors.full_messages
      render "new"
    end
  end

  def goal_params
    params.require(:goal).permit(:content)
  end



end
