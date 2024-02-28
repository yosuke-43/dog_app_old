class User < ApplicationRecord
  authenticates_with_sorcery!

  #認証関係のバリデーション
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true

  #他テーブルとの関係性
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board

  #current_userかどうか判定する
  def own?(object)
    id == object.user_id
  end

  # ブックマークに追加する
  def bookmark(board)
    bookmark_boards << board
  end

  # ブックマークを外す
  def unbookmark(board)
    bookmark_boards.destroy(board)
  end

  # ブックマークをしているか判定する
  def bookmark?(board)
    bookmark_boards.include?(board)
  end
end
