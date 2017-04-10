class UsersController < ApplicationController
  def show
  	@user = User.find_by(username: params[:username])
  	@tweets = @user.tweets
  	#@observations = @user.observations
  end
end
