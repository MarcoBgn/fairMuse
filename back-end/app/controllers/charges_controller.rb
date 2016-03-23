class ChargesController < ApplicationController
    
  def new
  end
  
  def show
    render json: @charge
  end
  
  def create
   p @amount = 50
          
    customer = Stripe::Customer.create(
        email: params[:stripeEmail], 
        source: params[:stripeToken])
          
   p @charge = Stripe::Charge.create(
        customer: customer.id, 
        amount: @amount,
        description: 'artist contribution',
        currency: 'gbp'
        ) 
          
    rescue Stripe::CardError => e 
              flash[:error.message] = e.message
              redirect_to new_charge_path
  end
end
