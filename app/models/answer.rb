class Answer < ApplicationRecord
    #外部キーの設定
    belongs_to :question
    has_many :dog_answer_rerationships, dependent: :destroy
    has_many :dogs, through: :dog_answer_rerationships
end
