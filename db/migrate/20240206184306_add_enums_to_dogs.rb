class AddEnumsToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :activity_level, :integer, default: nil
    add_column :dogs, :solitude_tolerance, :integer, default: nil
    add_column :dogs, :care_difficulty, :integer, default: nil
  end
end
