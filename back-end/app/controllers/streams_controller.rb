class StreamsController < ApplicationController
  
  def create
    track = Treack.get(params[:track_id])
    stream = Stream.create(track_id: track.id, user_id: current_user.id, total_plays: )
  end
  
  private
  
  def plays_count
    track = Track.get(params[:track_id])
  end
end