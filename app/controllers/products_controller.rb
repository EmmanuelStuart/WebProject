class ProductsController < ApplicationController


  def index

    @category = Category.all

    if params[:search]
      if params[:category_id] == "all"
        @products = Product.where("productName LIKE '%#{params[:search]}%' OR productInfo LIKE '%#{params[:search]}%'").order(:productName).page(params[:page]).per(3)
      else
        # @products = Product.where("category_id LIKE '%#{params[:category_id]}%'").search(params[:search])
        @products = Product.where("productName LIKE '%#{params[:search]}%' AND category_id LIKE '%#{params[:category_id]}%'").order(:productName).page(params[:page]).per(3)
        # @products = Product.all
      end
    else
      @products = Product.all.page(params[:page]).per(3)
    end
  end

  def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end

  def recentlyUpdated
    @productsRecentlyUpdated = Product.where('updated_at >= :three_days_ago', :three_days_ago => Time.now - 3.days).order(updated_at: :desc).page(params[:page]).per(3)

    # @productsRecentlyUpdated = Product.where('created_at >= :seven_days_ago or updated_at >= :three_days_ago',
    #       :seven_days_ago  => Time.now - 7.days,
    #       :three_days_ago => Time.now - 3.days).order(:updated_at).page(params[:page]).per(3)

    if params[:search]
      if params[:category_id] == "all"
        @productsRecentlyUpdated = Product.where("productName LIKE '%#{params[:search]}%' OR productInfo LIKE '%#{params[:search]}%' AND created_at = #{Time.now - 30.days} AND updated_at = #{Time.now - 7.days}").order(:productName).page(params[:page]).per(3)
      else
        # @products = Product.where("category_id LIKE '%#{params[:category_id]}%'").search(params[:search])
        @productsRecentlyUpdated = Product.where("productName LIKE '%#{params[:search]}%' AND category_id LIKE '%#{params[:category_id]}%' AND created_at = #{Time.now - 30.days } AND updated_at = #{Time.now - 7.days}").order(:productName).page(params[:page]).per(3)
      end
    else
      @products = Product.all.page(params[:page]).per(2)
    end
  end

  def new
    # @new = Product.where("created_at >= #{Time.now - 15.days}").order(:productName).page(params[:page]).per(3)
    @new = Product.where('created_at >= :fifteen_days_ago', :fifteen_days_ago => Time.now - 15.days).order(:created_at).page(params[:page]).per(3)

    if params[:search]
      if params[:category_id] == "all"
        @new = Product.where("productName LIKE '%#{params[:search]}%' OR productInfo LIKE '%#{params[:search]}%' AND created_at = #{Time.now - 30.days} AND updated_at = #{Time.now - 7.days}").order(:productName).page(params[:page]).per(3)
      else
        # @products = Product.where("category_id LIKE '%#{params[:category_id]}%'").search(params[:search])
        @new = Product.where("productName LIKE '%#{params[:search]}%' AND category_id LIKE '%#{params[:category_id]}%' AND created_at = #{Time.now - 30.days } AND updated_at = #{Time.now - 7.days}").order(:productName).page(params[:page]).per(3)
      end
    else
      @products = Product.all.page(params[:page]).per(2)
    end
  end



end
