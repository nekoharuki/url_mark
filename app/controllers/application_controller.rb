class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_user

  def set_current_user
    @current_user=User.find_by(id: session[:user_id])
  end

  def now_login_check
    if session[:user_id]!=nil
      flash[:alert]="そのページには行けません"
    end
  end
  def now_logout_check
    if session[:user_id]==nil
      flash[:alert]="そのページには行けません"
    end
  end
end
