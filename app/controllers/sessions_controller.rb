class SessionsController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Wrong password or email"
      render :new
    end
  end

  def destroy
    reset_session
    # session.delete(:user_id)
    redirect_to root_path
  end

end
