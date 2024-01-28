class Comment < ApplicationRecord
  #他テーブルとのアソシエーション
  belongs_to :user
  belongs_to :board

  #validationの設定
  validates :body, presence: true, length: { maximum: 65_535 }

end
