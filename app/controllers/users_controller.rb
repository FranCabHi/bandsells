class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def destroy
    if current_user.has_role? :admin
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_list_path, notice: 'User deleted.'
    end
  end
end