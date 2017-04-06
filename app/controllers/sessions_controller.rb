class SessionsController < ApplicationController

  def login
    @all = User.all

    if params[:username]

      @user = User.find_by("username IS '#{params[:username]}'")

      if (@user && params[:username] == @user.username && params[:password] == @user.password)
        session[:user] = @user.username
        redirect_to about_url
      else
        # render partial: 'shared_partials/footer'
        session[:error] = "error"
      end
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end


  def signup
    if params[:username]
      User.create!(username: params[:username], password: params[:password], fullName: params[:fullName], address: params[:address], email: params[:email], phone: params[:phone], province_id: params[:province_id])
      session[:user] = params[:username]
      redirect_to root_url
    end
  end

  def selectProvince
    @province = Province.all
  end





end
