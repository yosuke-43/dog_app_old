class AddDogImageToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :dog_image, :string
  end
end
