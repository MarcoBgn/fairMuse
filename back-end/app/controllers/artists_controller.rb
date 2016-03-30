class ArtistsController < ApplicationController
  before_filter :authenticate_user_from_token

  def index
    if current_user
      render nothing: true
    else
      render json:{}, status: :unauthorized
    end
  end

  def get_balance
    balance = Artist.find_by(id: params[:artist_id])
    p "----------------"
    p balance
    p"--------------------"
  end
end
