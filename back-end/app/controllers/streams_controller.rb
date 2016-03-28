class StreamsController < ApplicationController
  
  def create
    Stream.find_or_create_by(track_id: params[:track_id], user_id: user_id) do |stream|
      stream.total_plays = total_count
      stream.weekly_plays = weekly_count
      stream.update(total_plays: total_count, weekly_plays: weekly_count)
      stream.save
    end
    
    
                          
    render json:{}, status: :ok
  end
  
  private
  
  def total_count
    stream = Stream.find(track_id: params[:track_id], user_id: user_id)
    if stream.total_plays
     return stream.total_plays + 1
    end
    return 1
  end
  
  def weekly_count
    stream = Stream.find(track_id: params[:track_id], user_id: user_id)
    if stream.weekly_plays
      return stream.weekly_plays + 1
    end
    return 1
  end
  
  def user_id
    if current_user
      current_user.id
    end
      return 1
  end
  
end