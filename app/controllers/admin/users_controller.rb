class Admin::UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirm)
  end
end