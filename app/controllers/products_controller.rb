class ProductsController < ApplicationController


  def index

    @category = Category.all

    if params[:search]
      # @products = Product.where('productName LIKE ?', "%#{params[:search]}%")
      # @products = Product.where('category LIKE ? ', "#{params[:search]}")
      # @products = Product.where("category = 'cpu'")

      # @category.each do |c|
      #   @products = Product.where("productName LIKE '%#{params[:search]}%' OR productInfo LIKE '%#{params[:search]}%'
      #   OR category_id LIKE '%#{params[:search]}%'")
      # end


      # @categorySearch = Category.find('id').where("name LIKE '%#{params[:search]}%'")


      # working
      @products = Product.where("productName LIKE '%#{params[:search]}%' OR productInfo LIKE '%#{params[:search]}%'")

      # @categorySearch = Category.find_by("name LIKE '%#{params[:search]}%'")
      # @products = Product.where("productName LIKE '%#{params[:search]}%' OR productInfo LIKE '%#{params[:search]}%'
      # OR category_id IS '%#{@categorySearch}%'")





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
