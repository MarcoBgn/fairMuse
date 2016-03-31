class ChargesController < ApplicationController
  SUBSCRIPTION_AMOUNT = 900
  
  def new
  end

  def index
  end

  def create
    parse_amount(params[:amount])
    user_type(params[:user_id])
    stripe(params[:stripeEmail], params[:stripeToken])
  end

  private

  def user_type(params_id)
    if params_id
      @user = User.find(params_id)
    end
      @user = User.find(0)
  end
  
  def parse_amount(amount)
    @amount = amount.to_i * 100
  end

  def stripe(email, token)
    customer = Stripe::Customer.create(
      email: email,
      source: token)
      
    @charge = Stripe::Charge.create(
      customer: customer.id,
      amount: (@amount ? @amount : SUBSCRIPTION_AMOUNT),
      description: 'artist contribution',
      currency: 'gbp')
      @amount ? @user.balance += @amount : @user.balance = SUBSCRIPTION_AMOUNT

    redirect_to 'http://localhost:9000/#/success'
  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to new_charge_path
  end
end

