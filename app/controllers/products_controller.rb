class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def display
    @product = Product.find(params[:number].to_i)
  end
end
