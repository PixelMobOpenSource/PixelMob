class Api::GamesController < ApplicationController
  def show
    render json: Game.find(params[:id])
  end
  def index
    render json: Game.all
  end
end
