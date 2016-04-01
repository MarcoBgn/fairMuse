class TracksController < ApplicationController
  before_action :set_track, only: [:show, :update, :destroy]

  def index
    @tracks = Track.all
    render json: @tracks.to_json(methods: [:track_url, :image_url])
  end

  def show
    render json: @track
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      render json: @track, status: :created, location: @track
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      head :no_content
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @track.destroy
    head :no_content
  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:name, :genre, :file, :image, :artist_id, :artist_name)
    end
end
