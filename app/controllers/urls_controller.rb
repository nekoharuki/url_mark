class UrlsController < ApplicationController
  def index
    @urls=Url.all
  end

  def new
    @url=Url.new
  end

  def edit
    @url=Url.find_by(id: params[:id])
  end

  def update
    @url=Url.find_by(id: params[:id])
    @url.name=params[:name]
    @url.url=params[:url]
    @url.save
    redirect_to("/urls/#{@url.id}")
  end
  def show
  @url=Url.find_by(id: params[:id])
  end
  def create
    @url=Url.new(url: params[:url], name: params[:name], user_id: 6)
    if @url.save
      redirect_to("/urls/index")
    else
    end
  end


  def destroy
    @url=Url.find_by(id: params[:id])
    @url.destroy
    redirect_to("/urls/index")
  end
end
