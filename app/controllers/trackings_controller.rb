class TrackingsController < ApplicationController
  before_action :set_tracking, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /trackings
  def index
    @trackings = Tracking.all
  end

  # GET /trackings/1
  def show
  end

  # GET /trackings/new
  def new
    @tracking = Tracking.new
  end

  # GET /trackings/1/edit
  def edit
  end

  # POST /trackings
  def create
    @tracking = Tracking.new(tracking_params)

    if @tracking.save
      render :nothing => true, status: 200
      #redirect_to @tracking, notice: 'Tracking was successfully created.'
    else
      #render :new
    end
  end

  # PATCH/PUT /trackings/1
  def update
    if @tracking.update(tracking_params)
      redirect_to @tracking, notice: 'Tracking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trackings/1
  def destroy
    @tracking.destroy
    redirect_to trackings_url, notice: 'Tracking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracking
      @tracking = Tracking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tracking_params
      params.require(:tracking).permit(:page_url, :video_url)
    end
end
