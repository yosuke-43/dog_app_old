class AddUniqueIndexToDogAnswerRerationships < ActiveRecord::Migration[7.1]
  def change
    add_index :dog_answer_rerationships, [:dog_id, :answer_id], unique: true
  end
end
