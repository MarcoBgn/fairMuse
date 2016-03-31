class ChargesController < ApplicationController

  def new
  end

  def index
  end

  def create
    amount = params[:amount]
    if_user(params[:user_id])
    @user.balance = 0
    amount ? @user.balance += amount.to_i : @user.balance = 9

    customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken])

    @charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount ? amount.to_i : 900,
      description: 'artist contribution',
      currency: 'gbp')

    redirect_to 'http://localhost:9000/#/success'
  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to new_charge_path
  end

  private

  def if_user(params_user_id)
    if params_user_id
      @user = User.find(params_user_id)
    else
      @user = User.find(0)
    end
  end
end