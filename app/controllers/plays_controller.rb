class PlaysController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @plays = Play.all

  end

  def create
    @play = Play.new(post_params)
    if @play.save
      render :new
    end
  end


  def new
    @play = Play.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end


  def save_my_play

    @game = Game.last
    array_images = Array.new()
    @game.images.each do |image|

      array_images.push(url_for(image))
    end

    countdown = params[:countdown]

    play = Play.new
    play.current_time = countdown
    play.image_url = array_images.index(array_images.sample)
    play.save
    redirect_to new_play_path
  end


  private

  def post_params
    params.require(:play).permit(:current_time, :image_url)
  end
end
