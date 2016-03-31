class PaymentsController < ApplicationController

  def pay
    user = User.find_by(id: params[:user_id])
    new_balance = user.balance - 100

    user.update(balance: new_balance)

    tot_plays = 25
    track_num =[2, 1, 6]
    track_plays = [3, 2, 20]
    streams = Stream.where(user_id: params[:user_id]).each do |stream|
      tot_plays += stream.weekly_plays
      track_num << stream.track_id
      track_plays << stream.weekly_plays
    end
    payments = track_plays.map do |plays|     #[12, 8, 80]
      plays.to_f/tot_plays * 100
    end
    track_num.each_with_index do |track, index|
      artist_id = Track.find_by(id: track).artist_id
      artist = Artist.find_by(id: artist_id)
      new_balance = artist.balance + payments[index]
      artist.update(balance: new_balance)
    end
    render json:{message: "default message"}
  end

  private
  def user_balance(user)
    user.balance ? user.balance : 0
  end
end