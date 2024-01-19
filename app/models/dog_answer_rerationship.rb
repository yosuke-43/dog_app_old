class DogAnswerRerationship < ApplicationRecord
  
  #他テーブルとの依存関係
  belongs_to :dog
  belongs_to :answer

  #バリデーションについて
  validates :dog_id, uniqueness: { scope: :answer_id}

end
