class OrderController < ApplicationController
  def cart
    @cart = Order.all
    # @cart = Order.where("User is '#{session[:user]}'")
  end
end
