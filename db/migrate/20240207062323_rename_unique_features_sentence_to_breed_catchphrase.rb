class RenameUniqueFeaturesSentenceToBreedCatchphrase < ActiveRecord::Migration[7.1]
  def change
    rename_column :dogs, :unique_features_sentence, :breed_catchphrase 
  end
end
