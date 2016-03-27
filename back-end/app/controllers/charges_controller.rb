class ChargesController < ApplicationController

  def new
  end

  def index
  end

  def create
    @amount = 50

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken])

    @charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'artist contribution',
      currency: 'gbp')

    redirect_to 'http://localhost:9000/#/success'
  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to new_charge_path
  end
end