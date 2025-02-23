class UrlsController < ApplicationController
  before_action :now_logout_check
  def index
    @urls=Url.where(user_id: @current_user.id)
  end

  def new
    @url=Url.new
  end

  def edit
    @url=Url.find_by(id: params[:id])
  end

  def update
    @url=Url.find_by(id: params[:id])
    @url.name=params[:name]
    @url.url=params[:url]
    @url.genre=params[:genre]
    @url.memo=params[:memo]
    if @url.save
      flash[:notice]="URLを編集しました"
    redirect_to("/urls/#{@url.id}")
    else
      flash[:alert]="URLの編集に失敗しました"
      render("urls/edit")
    end
  end
  def show
  @url=Url.find_by(id: params[:id])
  end
  def create
    @url=Url.new(url: params[:url], name: params[:name], user_id: @current_user.id, genre: params[:genre], memo: params[:memo])
    if @url.save
      flash[:notice]="URLを登録しました"
      redirect_to("/urls/index")
    else
      flash[:alert]="URLの登録に失敗しました"
      render("urls/new")
    end
  end


  def destroy
    @url=Url.find_by(id: params[:id])
    if @url.destroy
      flash[:notice]="URLを削除しました"
    redirect_to("/urls/index")
    else
    flash[:alert]="URLの削除に失敗しました"
    render("urls/index")
    end
  end
  def like
      @likes=Like.where(user_id: @current_user.id)
  end
end
