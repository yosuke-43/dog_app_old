class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :breed, null: false
      t.string :height
      t.string :weight
      t.string :hair_length

      t.timestamps
    end
  end
end
