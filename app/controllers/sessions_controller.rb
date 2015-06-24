class SessionsController < ApplicationController
  def login
    user = User.find_by(name: user_params[:name])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
