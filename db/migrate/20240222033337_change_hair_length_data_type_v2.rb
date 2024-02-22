class ChangeHairLengthDataTypeV2 < ActiveRecord::Migration[7.1]
  def change
    # change_column :dogs, :hair_length, :integer, default: nil
    # 以前は上記のようにしていた。
    if Rails.env.development? || Rails.env.test?
      change_column :dogs, :hair_length, :integer, default: nil
    elsif
      change_column :dogs, :hair_length, 'integer USING CAST(hair_length AS integer)'
    end
  end
end
