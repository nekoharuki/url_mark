class UsersController < ApplicationController
  before_action :now_login_check, { only: [ :new, :create, :login_form, :login ] }
  before_action :now_logout_check, { only: [ :index, :show, :edit, :update, :destroy, :logout, :current_check, :myurl, :password_change, :password_change_form, :logout ] }
  before_action :current_check, { only: [ :show, :edit, :update, :destroy, :password_change, :password_change_form ] }

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
    exist_user=User.find_by(email: params[:email])
    @name=params[:name]
    @email=params[:email]
    @password=params[:password]
    if exist_user
      if exist_user && exist_user.authenticate(params[:password])
        flash[:notice]="ログインに成功しました"
        session[:user_id]=exist_user.id
        redirect_to("/urls/index")
      else
        flash[:alert]="そのメールアドレスはすでに登録されています"
        render("users/new")
      end
    else
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id]=@user.id
        flash[:notice] = "ユーザー登録に成功しました"
        redirect_to("/urls/index")
      else
        flash[:alert] = "ユーザー登録に失敗しました"
        render("users/new")
      end
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @name=@user.name
    @email=@user.email
  end

  def update
    @user = User.find_by(id: params[:id])
    @name=params[:name]
    @email=params[:email]
    if @user
      @user.name = params[:name]
      @user.email = params[:email]
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
        redirect_to("/login")
      else
        flash[:alert] = "ユーザー削除できませんでした"
        redirect_to("/users/#{@user.id}")
      end
    else
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to("/users/#{@user.id}")
    end
  end
  def login_form
  end
  def login
    @user = User.find_by(email: params[:email])
    @email=params[:email]
    @password=params[:password]
    if @user
      if @user && @user.authenticate(params[:password])
        flash[:notice]="ログインに成功しました"
        session[:user_id]=@user.id
        redirect_to("/urls/index")
      else
        flash[:alert]="メールアドレスまたはパスワードが間違っています"
        render("users/login_form")
      end
    else
      flash[:alert]="メールアドレスまたはパスワードが間違っています"
      render("users/login_form")
    end
  end
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトに成功しました"
    redirect_to("/login")
  end
  def password_change
    @user=User.find_by(id: params[:id])
    @current_password=params[:current_password]
    @new_password=params[:new_password]
    if @user
      if @user && @user.authenticate(params[:current_password])
        @user.password=params[:new_password]
        @user.save
        flash[:notice]="パスワードの変更に成功しました"
        redirect_to("/users/#{@user.id}")
      else
        flash[:alert]="パスワードが間違っています"
        render("users/password_change_form")
      end
    else
      flash[:alert]="ユーザーが見つかりませんでした"
      redirect_to("/urls/index")
    end
  end
  def password_change_form
    @user=User.find_by(id: params[:id])
  end
  def myurl
    @user=User.find_by(id: params[:id])
    if @user
      @urls=Url.where(user_id: @user.id)
    else
      flash[:alert]="そのユーザーは存在いません"
      redirect_to("/urls/index")
    end
  end

  def current_check
    if @current_user.id!=params[:id].to_i || @current_user==nil || params[:id]==nil
      flash[:alert]="そのページには行けません"
      redirect_to("/urls/index")
    end
  end
end
