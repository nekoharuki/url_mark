class FollowsController < ApplicationController

  before_action :now_logout_check
  before_action :follow_check

  def create
    @follow=Follow.new(follower_user: @current_user.id, followed_user: params[:followed_user_id])
    if @follow.save
      flash[:notice]="フォロー登録できました"
      redirect_to("/urls/index")
    else
      flash[:alert]="フォロー登録に失敗しました"
      redirect_to("/urls/index")
    end
  end

  def destroy
    @follow=Follow.find_by(follower_user: @current_user.id, followed_user: params[:followed_user_id])
    if @follow
      if @follow.destroy
        flash[:notice]="フォロー削除できました"
        redirect_to("/urls/index")
      else
        flash[:alert]="フォロー削除に失敗しました"
        redirect_to("/urls/index")
      end
    else
      flash[:alert]="フォロー削除に失敗しました"
      redirect_to("/urls/index")
    end
  end

  def follow_check
    @user=User.find_by(id: params[:followed_user_id])
    if @user==nil
      flash[:alert]="フォロー登録に失敗しました"
      redirect_to("/urls/index")
    end
  end
end
