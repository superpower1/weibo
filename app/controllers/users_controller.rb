class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      # 这里使用的是sessions_helper中定义的login方法
      login @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_url
    end
  end

  # 健壮参数，规定允许提交的字段
  def users_params
    params.require(:user).permit(:userName, :email, :password, :password_confirmation)

  end

end
