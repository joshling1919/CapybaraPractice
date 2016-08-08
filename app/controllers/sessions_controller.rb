class SessionsController < ApplicationController
  def new
  end

  def create
    username = session_params[:username]
    password = session_params[:password]
    @user = User.find_by_credentials(username, password)
    if @user
      login(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = "bad params"
      render "new"
    end
  end


  def destroy
    logout
    redirect_to new_session_url
  end

private
def session_params
  params.require(:session).permit(:password,:username)
end


end
