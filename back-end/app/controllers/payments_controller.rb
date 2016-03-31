class PaymentsController < ApplicationController

  def pay
    user = User.find_by(id: params[:user_id])
    new_balance = user.balance - 100
    user.update(balance: new_balance)
    
    streams = Stream.where(user_id: params[:user_id])
    Stream.weekly_usage(streams)
    
    render json:{message: "default message"}
  end
end