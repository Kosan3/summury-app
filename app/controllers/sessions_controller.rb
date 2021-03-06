class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      log_in(user)
      remember user
      redirect_to user_path(user)
    else
      flash.now[:danger] = '名前とパスワードが一致しません'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
