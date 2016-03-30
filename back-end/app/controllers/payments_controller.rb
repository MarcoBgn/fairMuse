class PaymentsController < ApplicationController

  def pay
    user_id = params[:user_id]
    plays = 0
    streams = Stream.where(user_id: params[:user_id]).map do |stream|
      plays += stream.total_plays
      {track_id: stream.track_id, total_plays: stream.total_plays}
    end
    p "================"
    p streams
    p plays
    p"=================="
  end
  def get_user_stream_info
    stream_info = Stream.where(user_id: params[:user_id]).map do |stream|
      {track_id: stream.track_id, total_plays: stream.total_plays}
    end
    render json: stream_info
  end

end
