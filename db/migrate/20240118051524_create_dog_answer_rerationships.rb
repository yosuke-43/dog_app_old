class CreateDogAnswerRerationships < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_answer_rerationships do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
