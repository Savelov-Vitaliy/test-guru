class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:requested_url].present? ? cookies[:requested_url] : root_path
    else
      flash.now[:alert] = "Wrong password or email"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
