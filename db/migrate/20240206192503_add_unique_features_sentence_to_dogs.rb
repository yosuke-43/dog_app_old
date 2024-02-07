class AddUniqueFeaturesSentenceToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :unique_features_sentence, :text
  end
end
