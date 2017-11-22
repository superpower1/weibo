class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # 健壮参数，规定允许提交的字段
  def users_params
    params.require(:user).permit(:userName, :email, :password, :password_confirmation)

  end

end
