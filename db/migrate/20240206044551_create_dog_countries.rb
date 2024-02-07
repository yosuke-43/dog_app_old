class CreateDogCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_countries do |t|
      t.string :name

      t.timestamps
    end
  end
end
