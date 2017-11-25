class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # 这里使用的是sessions_helper中定义的login方法
      login @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    render 'new'
  end
end
