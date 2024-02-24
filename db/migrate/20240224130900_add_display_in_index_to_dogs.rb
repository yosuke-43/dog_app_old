class AddDisplayInIndexToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :display_in_index, :integer, default: 0
  end
end
