class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end


  def destroy
    @admin = current_user
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path(@admin)
  end
end