class PaymentsController < ApplicationController

  def pay
    user_id = params[:user_id]
    user = User.find_by(id: user_id)
    user_balance = user.balance
    new_balance = user_balance - 100
    user.update(balance: new_balance)

    tot_plays = 0
    track_num =[]
    track_plays = []
    streams = Stream.where(user_id: user_id).each do |stream|
      tot_plays += stream.total_plays
      track_num << stream.track_id
      track_plays << stream.total_plays
    end
    payments = track_plays.map do |plays|
      plays.to_f/tot_plays * 100
    end
    track_num.each_with_index do |track, index|
      artist_id = Track.find_by(id: track).artist_id
      artist = Artist.find_by(id: artist_id)
      cur_balance = artist.balance
      new_balance = cur_balance + payments[index]
      artist.update(balance: new_balance)
    end
  end
  def get_user_stream_info
    stream_info = Stream.where(user_id: params[:user_id]).map do |stream|
      {track_id: stream.track_id, total_plays: stream.total_plays}
    end
    render json: stream_info
  end

end
