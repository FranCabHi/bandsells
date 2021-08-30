class MainController < ApplicationController
  #before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index ]

  # GET /orders or /orders.json
  def index
    
  end
  
	def dashboard
    if current_user.has_role? :admin
      @products = Product.all.order(stock: :desc)
      @users = User.all.joins(:roles).order(:role_id)
    elsif current_user.has_role? :owner
      @products = Product.where(user_id: current_user.id).order(stock: :desc)
      @users = User.joins(:orders, :products).where(orders: {state: 2}, products: {user_id: current_user.id})
    else
      @products = Product.joins(:orders).where(orders: {user_id: current_user.id, state: 2})
      @users = User.includes(:orders, :products).where(orders: {user_id: current_user.id, state: 2})
    end
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