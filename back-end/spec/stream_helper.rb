def create_stream
  Stream.create(track_id: 1,
                user_id: 1,
                total_plays: 1,
                weekly_plays: 1)
end
