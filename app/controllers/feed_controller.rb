class FeedController < ApplicationController
	before_action :authenticate_user!

  def show
  	@observations = Observation.where(user: current_user.all_following)
  end
end