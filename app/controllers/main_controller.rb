class MainController < ApplicationController

  def index
  end

  def about
    @about = PageContent.first
  end

  def contact
    @contact = PageContent.first
  end

  def display
  end
  
end
