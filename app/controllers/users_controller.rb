class UsersController < ApplicationController
  before_action :now_login_check, { only: [ :new, :create, :login_form, :login ] }
  before_action :now_logout_check, { only: [ :index, :show, :edit, :update, :destroy, :logout ] }

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
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id]=@user.id
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
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
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
      session[:user_id]=nil
      flash[:notice] = "ユーザー削除できました"
      redirect_to("/users/index")
    else
      flash[:alert] = "ユーザー削除できませんでした"
      redirect_to("/users/#{@user.id}")
    end
  end
  def login_form
  end
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    @email=params[:email]
    @password=params[:password]
    if @user
      flash[:notice]="ログインできました"
      session[:user_id]=@user.id
      redirect_to("/urls/index")
    else
      flash[:alert]="ログインできませんでした"
      render("users/login_form")
    end
  end
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトできました"
    redirect_to("/login")
  end
end
