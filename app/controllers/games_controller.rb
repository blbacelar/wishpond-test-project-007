class GamesController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @games = Game.all
    @game = Game.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(post_params)
    if @game.save
      redirect_to @game
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
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
