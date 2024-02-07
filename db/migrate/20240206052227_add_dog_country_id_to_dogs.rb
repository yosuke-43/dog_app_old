class AddDogCountryIdToDogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :dog_country, foreign_key: true, default: nil
  end
end
