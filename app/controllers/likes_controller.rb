class LikesController < ApplicationController
  before_action :now_logout_check

  def create
    @like=Like.new(url_id: params[:url_id], user_id: @current_user.id)
    if @like.save
      flash[:notice]="お気に入り登録できました"
      redirect_to("/urls/like")
    else
      flash[:alert]="お気に入り登録に失敗しました"
      redirect_to("/urls/index")
    end
  end

  def destroy
    @like=Like.find_by(url_id: params[:url_id], user_id: @current_user.id)
    if @like
      if @like.destroy
        flash[:notice]="お気に入り削除できました"
        redirect_to("/urls/like")
      else
        flash[:alert]="お気に入り削除に失敗しました"
        redirect_to("/urls/like")
      end
    else
      flash[:alert]="お気に入り削除に失敗しました"
      redirect_to("/urls/like")
    end
  end
end
