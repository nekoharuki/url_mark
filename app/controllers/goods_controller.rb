class GoodsController < ApplicationController
  before_action :now_logout_check

  def create
    @good=Good.new(url_id: params[:url_id], user_id: @current_user.id)
    if @good.save
      flash[:notice]="お気に入り登録できました"
      redirect_to("/urls/index")
    else
      flash[:alert]="お気に入り登録に失敗しました"
      redirect_to("/urls/index")
    end
  end

  def destroy
    @good=Good.find_by(url_id: params[:url_id], user_id: @current_user.id)
    if @good
      if @good.destroy
        flash[:notice]="お気に入り削除できました"
        redirect_to("/urls/index")
      else
        flash[:alert]="お気に入り削除に失敗しました"
        redirect_to("/urls/index")
      end
    else
      flash[:alert]="お気に入り削除に失敗しました"
      redirect_to("/urls/index")
    end
  end
end
