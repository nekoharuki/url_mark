class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
  allow_browser versions: :modern
  before_action :set_current_user

  def set_current_user
    @current_user=User.find_by(id: session[:user_id])
  end

  def now_login_check
    if @current_user!=nil
      flash[:alert]="そのページには行けません"
      redirect_to("/urls/index")
    end
  end
  def now_logout_check
    if @current_user==nil
      flash[:alert]="そのページには行けません"
      redirect_to("/login")
    end
  end
end
