class CreateDogSizeTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_size_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
