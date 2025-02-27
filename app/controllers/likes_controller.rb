class LikesController < ApplicationController
  before_action :now_logout_check
  before_action :like_check

  def create
    @like=Like.new(url_id: params[:url_id], user_id: @current_user.id)
    if @like.save
      flash[:notice]="いいね登録できました"
      redirect_to("/urls/index")
    else
      flash[:alert]="いいね登録に失敗しました"
      redirect_to("/urls/index")
    end
  end

  def destroy
    @like=Like.find_by(url_id: params[:url_id], user_id: @current_user.id)
    if @like
      if @like.destroy
        flash[:notice]="いいね削除できました"
        redirect_to("/urls/index")
      else
        flash[:alert]="いいね削除に失敗しました"
        redirect_to("/urls/index")
      end
    else
      flash[:alert]="いいね削除に失敗しました"
      redirect_to("/urls/index")
    end
  end
  def like_check
    @url=Url.find_by(id: params[:url_id])
    if @url
      if @url.user_id==@current_user.id
        flash[:alert]="いいね登録に失敗しました"
        redirect_to("/urls/index")
      end
    else
      flash[:alert]="いいね登録に失敗しました"
      redirect_to("/urls/index")
    end
  end
end
