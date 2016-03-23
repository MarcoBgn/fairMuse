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
          
    charge = Stripe::Charge.create(
      customer: customer.id, 
      amount: @amount,
      description: 'artist contribution',
      currency: 'GBP'
      ) 
      
      redirect_to 'http://localhost:9000/#/success'
          
    rescue Stripe::CardError => e 
      flash[:error.message] = e.message
      redirect_to 'http://localhost:9000/#/failure'
  end
end
