class ObservationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  # GET /observations
  def index
    @observations = Observation.all
  end

  # GET /observations/1
  def show
    @observation = Observation.find(params[:id])
  end

  # GET /observations/new
  def new
    @observation = current_user.observations.new
  end

  # GET /observations/1/edit
  def edit
    @observation = current_user.observations.find(params[:id])
  end

  # POST /observations
  def create
    @observation = current_user.observations.new(observation_params)
    if @observation.save
      redirect_to @observation, notice: 'Observation was successfully created'
    else
      render :new
    end
  end

  # PATCH/PUT /observations/1
  def update
    @observation = current_user.observations.find(params[:id])
    if @observation.update(observation_params)
      redirect_to @observation, notice: 'Observation was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /observations/1
  def destroy
    @observation = current_user.observations.find(params[:id])
    @observation.destroy
    redirect_to observations_url, notice: 'Observation was successfully deleted'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_params
      params.require(:observation).permit(:user_id, :date, :time, :conditions, :sunrise, :sunset, :species, :saw, :heard, :latitude, :longitude, :notes)
    end
end
