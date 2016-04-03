class Stream < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  def self.weekly_usage(streams)
    user_weekly_plays = 0
    tracks_played=[]
    individual_track_plays=[]

    streams.each do |stream|
      user_weekly_plays += stream.weekly_plays
      tracks_played << stream.track_id
      individual_track_plays << stream.weekly_plays
    end

    payments = individual_track_plays.map do |plays|
      plays.to_f/user_weekly_plays * 100
    end

    tracks_played.each_with_index do |track, index|
       artist_id = Track.find_by(id: track).artist_id
       artist = Artist.find_by(id: artist_id)
       new_balance = artist.balance + payments[index]
       artist.update(balance: new_balance)
    end
  end
end
