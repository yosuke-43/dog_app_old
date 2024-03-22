class CommentsController < ApplicationController

    def create
      
        @comment = current_user.comments.build(comment_params)
        @board = Board.find(params[:board_id])  # コメントが属する掲示板を取得
      
        # respond_to do |format|
        #   if @comment.save
        #     format.html { redirect_to @board, notice: 'Comment was successfully created.' }
        #     format.json { render :show, status: :created, location: @comment }
        #     format.js   # ここで JS フォーマットを指定
        #   else
        #     format.html { render 'boards/show', locals: { board: @board } }  # エラー時の処理
        #     format.json { render json: @comment.errors, status: :unprocessable_entity }
        #     format.js   # エラー時も JS フォーマットを指定
        #   end
        # end

        respond_to do |format|
          if @comment.save
            format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_index_area', partial: 'comments/comments', locals: { comments: @comments }) }
          else
            format.html { redirect_to board_path(@board), notice: 'Comment was not saved.' }
          end
        end
      end      

    def destroy
        @comment = current_user.comments.find(params[:id])
        @comment.destroy!
    end

    private

    def comment_params
        params.require(:comment).permit(:body).merge(board_id: params[:board_id])
    end
end
