require "assets/stream_factory.rb"
class StreamsController < ApplicationController
  
  FIRST_PLAY=1

  def create
    stream = Stream.find_by(track_id: params[:track_id], user_id: user_id)
    StreamFactory.new.build(stream)
    render json:{}, status: :ok
  end
  
  private
  
  def total_count
    stream = Stream.find_by(track_id: params[:track_id], user_id: user_id)
    stream.total_plays + 1
  end
  
  def weekly_count
    stream = Stream.find_by(track_id: params[:track_id], user_id: user_id)
    stream.weekly_plays + 1 
  end
  
  def user_id
    current_user ? current_user.id : 1
  end
end