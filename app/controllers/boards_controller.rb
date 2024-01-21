class BoardsController < ApplicationController

  def new
  end

  def create
  end

  def index
    @boards = Board.all.includes(:user, :dog).order(created_at: :desc)
  end

  def show
  end
end
