class UsersController < ApplicationController
  before_action :authenticate_user!

  def destroy
    if current_user.has_role? :admin
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_list_path, notice: 'User deleted.'
    else
      redirect_to root_url, alert: "Denied Access."
    end
  end
end