class AddExplainToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :explain, :text
  end
end
