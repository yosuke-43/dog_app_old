class Dog < ApplicationRecord
    #外部キーの設定
    belongs_to :dog_size_type

    #バリデーションの設定
    validates :breed, presence: true
end
