class ProductsController < ApplicationController
  def index
    @products = Product.all

    # @tasks = if params[:search]
    #   Product.where('name LIKE %?%', "%#{params[:term]}%")
    # else
    #   Product.all
    # end
    # @products = Product.search(params[:term])
  end

  def display
    @product = Product.find(params[:number].to_i)
  end



  # def task_params
  #   params.require(:task).permit(:name, :term)
  # end

end
