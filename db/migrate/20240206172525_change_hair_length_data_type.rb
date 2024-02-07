class ChangeHairLengthDataType < ActiveRecord::Migration[7.1]
  def change
    change_column :dogs, :hair_length, :integer, default: nil
  end
end
