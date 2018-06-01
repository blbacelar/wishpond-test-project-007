class GamesController < ApplicationController
  before_action :set_post, only: [:destroy]

  def new
    if Game.nil?
      Game.first.destroy
    end

    @game = Game.new
  end

  def create
    @game = Game.new(post_params)
    if @game.save


      # It always destroy the previous plays
      Play.destroy_all

      redirect_to new_play_path
    else
      render :new
    end
  end


  private

  def set_post
    @game = Game.find(params[:id])
  end

  def post_params
    params.require(:game).permit(:description, images: [])
  end
end
