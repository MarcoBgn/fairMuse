class StreamsController < ApplicationController

  FIRST_PLAY=1

  def create
    stream = Stream.find_by(track_id: params[:track_id], user_id: user_id)
    add_stream(stream, params[:track_id])
    render json:{}, status: :ok
  end

  def get_user_stream_info
    stream_info = Stream.where(user_id: user_id).map do |stream|
      {track_id: Track.find(stream.track_id).name, total_plays: stream.total_plays}
    end
    render json: stream_info
  end

  private

  def add_stream(stream, track_id)
    if stream
      stream.update(total_plays: total_count(user_id), weekly_plays: weekly_count(user_id))
      stream.save
    else
      Stream.create(track_id: track_id,
        user_id: user_id,
        total_plays: FIRST_PLAY,
        weekly_plays: FIRST_PLAY)
    end
  end

  def total_count(user_id)
    stream = Stream.find_by(track_id: params[:track_id], user_id: user_id)
    stream.total_plays + 1
  end

  def weekly_count(user_id)
    stream = Stream.find_by(track_id: params[:track_id], user_id: user_id)
    stream.weekly_plays + 1
  end

  def user_id
    params[:user_id] ? params[:user_id] : 0
  end
end