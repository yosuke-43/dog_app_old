class Dog < ApplicationRecord
    #外部キーの設定
    belongs_to :dog_size_type
    has_many :dog_answer_rerationships, dependent: :destroy
    has_many :answers, through: :dog_answer_rerationships

    #バリデーションの設定
    validates :breed, presence: true
end
