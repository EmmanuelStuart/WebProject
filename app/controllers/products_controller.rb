class ProductsController < ApplicationController


  def index

    @category = Category.all

    if params[:search]
      if params[:category_id] == "all"
        @products = Product.where("productName LIKE '%#{params[:search]}%' OR productInfo LIKE '%#{params[:search]}%'").order(:productName)
      else
        # @products = Product.where("category_id LIKE '%#{params[:category_id]}%'").search(params[:search])
        @products = Product.where("productName LIKE '%#{params[:search]}%' AND category_id LIKE '%#{params[:category_id]}%'").order(:productName)
        # @products = Product.all
      end
    else
      @products = Product.all
    end
  end

  def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end



end
