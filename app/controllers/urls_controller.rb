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
    if @url
      @url.title=params[:title]
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
    else
      flash[:alert]="URLが見つかりませんでした"
      render("urls/edit")
    end
  end
  def show
    @url=Url.find_by(id: params[:id])
  end
  def create
    @url=Url.new(url: params[:url], title: params[:title], user_id: @current_user.id, genre: params[:genre], memo: params[:memo])
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
    if @url
      if @url.destroy
        flash[:notice]="URLを削除しました"
        redirect_to("/urls/index")
      else
        flash[:alert]="URLの削除に失敗しました"
        render("urls/index")
      end
    else
      flash[:alert]="URLが見つかりませんでした"
      render("urls/index")
    end
  end
  def like
      @likes=Like.where(user_id: @current_user.id)
  end
  def genre
      @genres=Url.select(:genre).distinct
  end
  def genres
      @genre=params[:genre]
      @urls=Url.where(genre: params[:genre])
  end
  def search
    @urls=Url.where(title: params[:title])
    if @urls.empty?
      flash[:alert]="該当するURLがありません"
      redirect_to("/urls/genre")
    else
      redirect_to("/urls/search/#{params[:title]}")
    end
  end
  def search_title
    @urls=Url.where(title: params[:title])
  end
end
