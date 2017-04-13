class OrderController < ApplicationController
  before_action :initialize_session

  def cart
    session[:items_on_cart] << params[:addItem].to_i
    @products_on_cart = Product.where("id = #{session[:items_on_cart]}")
    flash[:notice] = "Added to cart"
    # @cart = Order.where("User is '#{session[:user]}'")
  end

  private
  def initialize_session
    session[:items_on_cart] ||= []
  end
end
