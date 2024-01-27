class ChangeDogIdNullabilityInBoards < ActiveRecord::Migration[7.1]
  def change
    change_column :boards, :dog_id, :integer, null: true
  end
end