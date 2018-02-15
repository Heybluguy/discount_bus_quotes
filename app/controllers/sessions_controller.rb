class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_users_path
      else
        redirect_to user_path(user)
      end
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end