class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth(auth)
    if user.persisted?
      session[:user_id] = user.id
      flash[:notice] = "ログインしました"
      redirect_to("/urls/index")
    else
      flash[:alert] = "ログインに失敗しました: #{user.errors.full_messages.join(", ")}"
      redirect_to("/login")
    end
  end
end
