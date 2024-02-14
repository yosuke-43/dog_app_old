class BoardsController < ApplicationController
  before_action :set_board, only: %i[edit update destroy]

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
    @dog_breeds = Dog.pluck(:breed).uniq #pluckで:breedのカラムの値のみを配列で取得、重複はないけどuniqで取得。
    @q = Board.ransack(params[:q]) #ransackメソッドは、送られてきたパラメーターを元にテーブルからデータを検索するメソッドです。(whereメソッドのransack版というイメージです。)
    @boards = @q.result(distinct: true).includes(:user, :dog).order(created_at: :desc) #ransackメソッドで取得したデータをActiveRecord_Relationのオブジェクトに変換するメソッドです。
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to @board, success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :edit
    end
  end

  def destroy
    @board.destroy!
    redirect_to boards_path, success: t('defaults.message.deleted', item: Board.model_name.human)
  end

  private

  def set_board
    @board = current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, :dog_id, :board_image, :board_image_cache)
  end
end
