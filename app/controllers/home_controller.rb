class HomeController < ApplicationController
  before_action :now_login_check, { only: [ :top, :about ] }

  def top
  end
  def about
  end
end
