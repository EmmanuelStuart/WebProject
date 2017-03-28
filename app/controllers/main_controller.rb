class MainController < ApplicationController

  def index
    @category = Category.all
  end

  def about
    @about = PageContent.first
  end

  def contact
    @contact = PageContent.first
  end

  def display
  end

  def category

  end

end
