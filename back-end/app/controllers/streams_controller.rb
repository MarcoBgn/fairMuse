class StreamsController < ApplicationController
  
  FIRST_PLAY=1

  def create
    stream = Stream.find_by(track_id: params[:track_id], user_id: user_id)
    if stream
      stream.update(total_plays: total_count, weekly_plays: weekly_count)
      stream.save
    else
      Stream.create(track_id: params[:track_id],
                    user_id: user_id,
                    total_plays: FIRST_PLAY,
                    weekly_plays: FIRST_PLAY)
    end
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