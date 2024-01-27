class BoardsController < ApplicationController

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    
    if @board.save
      redirect_to boards_path, success: '投稿しました'
    else
      flash.now['danger'] = '投稿失敗しました'
      render :new
    end
  end

  def index
    @boards = Board.all.includes(:user, :dog).order(created_at: :desc)
  end

  def show
    @board = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :dog_id, :board_image, :board_image_cache)
  end
end
