class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader
  #他テーブルとの関係性
  belongs_to :user
  belongs_to :dog
  has_many :comments, dependent: :destroy

  #validation関係
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  #ransackの検索機能を使うために下記のメソッドを追加、どの属性や関連を検索可能とするかを指定する
  #特にこれは属性に関しての記述
  def self.ransackable_attributes(auth_object = nil)
    ["board_image", "body", "created_at", "dog_id", "id", "id_value", "title", "updated_at", "user_id"]
  end

  #ransackの検索機能を使うために下記のメソッドを追加、どの属性や関連を検索可能とするかを指定する
  #特にこれは関連に関しての記述
  def self.ransackable_associations(auth_object = nil)
    ["comments", "dog", "user"]
  end
end
