class ProductsController < ApplicationController
  def index
    # @products = Product.all

    if params[:search]
      # @products = Product.search(params[:search]).order(:productName)
      @products = Product.where('productName LIKE ?', "%#{params[:search]}%")
      #.order(:productName)
    else
      @products = Product.all
    end
  end

  def display
    @product = Product.find(params[:number].to_i)
  end


end
