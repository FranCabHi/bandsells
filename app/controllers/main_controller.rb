class MainController < ApplicationController
  #before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ dashboard ]

  # GET /orders or /orders.json
  def index
    
  end
  
	def dashboard
    @orders = Order.all
    @users = User.all
    @products = Product.all
  end

  def users
    @users = User.all
  end

  def edit_role
    @user = User.find(params[:user_id])
    @roles = Role.all
    if params[:admin] == "1"
      @user.add_role(:admin)
    elsif params[:admin] == "0"
      @user.remove_role(:admin)
    end

    if params[:owner] == "1"
      @user.grant(:owner)
    elsif params[:owner] == "0"
      @user.remove_role(:owner)
    end

    if params[:normaluser] == "1"
      @user.grant(:normaluser)
    elsif params[:normaluser] == "0"
      @user.remove_role(:normaluser)
    end

  end

end