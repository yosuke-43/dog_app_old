class RenameAndAddColumnsToDogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :dogs, :breed_catchphrase, :catchphrase
    rename_column :dogs, :breed_appearance_and_history_sentence, :features_sentence
    rename_column :dogs, :breed_personality_description_sentence, :personality_sentence

    add_column :dogs, :history_sentence, :text
    add_column :dogs, :recommended_for_whom, :text
  end
end
