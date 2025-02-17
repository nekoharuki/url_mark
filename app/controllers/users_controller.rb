class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー登録できました"
      redirect_to("/users/index")
    else
      flash[:alert] = "ユーザー登録できませんでした"
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー編集できました"
      redirect_to("/users/#{@user.id}")
    else
      flash[:alert] = "ユーザー編集できませんでした"
      render("users/edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:notice] = "ユーザー削除できました"
      redirect_to("/users/index")
    else
      flash[:alert] = "ユーザー削除できませんでした"
      redirect_to("/users/#{@user.id}")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
