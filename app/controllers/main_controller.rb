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


end