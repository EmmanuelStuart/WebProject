class ProductsController < ApplicationController


  def index

    @category = Category.all

    if params[:search]
      @products = Product.where('productName LIKE ?', "%#{params[:search]}%")
    elsif params[:category_id]
      @products = Product.where("category_id = #{ params[:category_id] }")
    else
      @products = Product.all
    end
  end

  def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end



end
