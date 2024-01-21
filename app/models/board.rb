class Board < ApplicationRecord
  #他テーブルとの関係性
  belongs_to :user
  belongs_to :dog

  #validation関係
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
