class StreamFactory
  
  def build(stream)
    end
    if stream
      stream.update(total_plays: total_count, weekly_plays: weekly_count)
      stream.save
    else
      Stream.create(track_id: params[:track_id],
                    user_id: user_id,
                    total_plays: FIRST_PLAY,
                    weekly_plays: FIRST_PLAY)
    end
  end
end