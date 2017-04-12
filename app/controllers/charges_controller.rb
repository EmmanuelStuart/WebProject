class ChargesController < ApplicationController
  def new
    @amount = 500
    @description = "Pay me the money, lol" #the text on the dialog box
  end

  def create
    # Amount in cents
    amount = 500 #5 cents
    #if current_user.stip_id_empty?
    @customer = Stripe::Customer.create(:email => params[:stripeEmail],
                                        :source  => params[:stripeToken])
    # else
    #   Stripe::Customer.find
    @charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer, im on the charges controller',
      :currency    => 'usd'
    )
    # if @charge.paid && @charge.amount == amount
    #   #mark order as paid
    #     order.status = "paid"
    #     order.stripe_charge_id = @charge.id
    #     order.save
    # end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
