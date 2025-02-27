class UrlsController < ApplicationController
  before_action :now_logout_check
  before_action :user_check, { only: [ :edit, :update, :destroy ] }

  def index
    @urls=Url.all
  end
  def new
    @url=Url.new
  end

  def edit
    @url=Url.find_by(id: params[:id])
    @title=@url.title
    @link=@url.link
    @genre=@url.genre
    @explanation=@url.explanation
  end

  def update
    @url=Url.find_by(id: params[:id])
    @title=params[:title]
    @link=params[:link]
    @genre=params[:genre]
    @explanation=params[:explanation]
    if @url
      @url.title=params[:title]
      @url.link=params[:link]
      @url.genre=params[:genre]
      @url.explanation=params[:explanation]
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
      @url = Url.new(link: params[:link], title: params[:title], user_id: @current_user.id, genre: params[:genre], explanation: params[:explanation])
      if params[:link].blank? || params[:title].blank? || params[:genre].blank?
        @title=params[:title]
        @link=params[:link]
        @genre=params[:genre]
        @explanation=params[:explanation]
        flash[:alert] = "入力してください"
        render("urls/new")
      else
        if @url.save
          flash[:notice] = "URLを登録に成功しました"
          redirect_to("/urls/index")
        else
          @title=params[:title]
          @link=params[:link]
          @genre=params[:genre]
          @explanation=params[:explanation]
          flash[:alert] = "URLの登録に失敗しました"
          render("urls/new")
        end
      end
    end
  def destroy
    @url=Url.find_by(id: params[:id])
    if @url
      if @url.destroy
        flash[:notice]="URLを削除に成功しました"
        redirect_to("/urls/index")
      else
        flash[:alert]="URLの削除に失敗しました"
        redirect_to("/urls/index")
      end
    else
      flash[:alert]="URLが見つかりませんでした"
      redirect_to("/urls/index")
    end
  end
  def like
      @likes=Like.where(user_id: @current_user.id)
  end
  def good
      @goods=Good.where(user_id: @current_user.id)
  end
  def search
      @genres=Url.select(:genre).distinct
  end
  def genres
      @genre=params[:genre]
      @urls=Url.where(genre: params[:genre])
  end
  def search_title
    @urls = Url.where("title LIKE ?", "%#{params[:title]}%")
    if @urls.empty?
      flash[:alert] = "該当するURLがありません"
      redirect_to("/urls/genre")
    else
      redirect_to urls_search_result_path(title: params[:title])
    end
  end
  def search_result
    @urls = Url.where("title LIKE ?", "%#{params[:title]}%")
  end
  def user_check
      @url=Url.find_by(id: params[:id])
      if @current_user.id!=@url.user_id || @current_user.id==nil || @url==nil
        flash[:alert]="そのページには行けません"
        redirect_to("/urls/index")
      end
  end
end
