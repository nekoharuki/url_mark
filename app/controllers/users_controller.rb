class UsersController < ApplicationController
  before_action :now_login_check, { only: [ :new, :create, :login_form, :login ] }
  before_action :now_logout_check, { only: [ :index, :show, :edit, :update, :destroy, :logout ] }
  before_action :current_check, { only: [ :show, :edit, :update, :destroy ] }

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
      flash[:notice] = "ユーザー登録に成功しました"
      redirect_to("/users/index")
    else
      flash[:alert] = "ユーザー登録に失敗しました"
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password = params[:password]
      if @user.save
        flash[:notice] = "ユーザー編集に成功しました"
        redirect_to("/users/#{@user.id}")
      else
        flash[:alert] = "ユーザー編集に失敗しました"
        render("users/edit")
      end
    else
      flash[:alert] = "ユーザーが見つかりませんでした"
      render("users/edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      if @user.destroy
        session[:user_id]=nil
        flash[:notice] = "ユーザー削除できました"
        redirect_to("/users/index")
      else
        flash[:alert] = "ユーザー削除できませんでした"
        redirect_to("/users/#{@user.id}")
      end
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to("/users/#{@user.id}")
    end
  end
  def login_form
  end
  def login
    @user = User.find_by(email: params[:email])
    if @user
      if @user && @user.authenticate(params[:password])
        flash[:notice]="ログインに成功しました"
        session[:user_id]=@user.id
        @email=params[:email]
        @password=params[:password]
        redirect_to("/urls/index")
      else
        flash[:alert]="メールアドレスまたはパスワードが間違っています"
        render("users/login_form")
      end
    else
      flash[:alert]="ログインに失敗しました"
      render("users/login_form")
    end
  end
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトに成功しました"
    redirect_to("/login")
  end
  def current_check
    if @current_user.id!=params[:id].to_i
      flash[:alert]="そのURLは適切ではありません"
      redirect_to("/urls/index")
    end
  end
end
