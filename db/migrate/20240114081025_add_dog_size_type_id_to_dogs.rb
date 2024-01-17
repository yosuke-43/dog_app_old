class AddDogSizeTypeIdToDogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :dog_size_type, null: false, foreign_key: true
  end
end
