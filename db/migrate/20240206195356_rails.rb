class Rails < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :breed_appearance_and_history_sentence, :text
    add_column :dogs, :breed_personality_description_sentence, :text
  end
end
