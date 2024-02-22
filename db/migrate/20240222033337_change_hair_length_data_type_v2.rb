class ChangeHairLengthDataTypeV2 < ActiveRecord::Migration[7.1]
  def change
    # change_column :dogs, :hair_length, :integer, default: nil
    # 以前は上記のようにしていた。
    if Rails.env.development? || Rails.env.test?
      change_column :dogs, :hair_length, :integer, default: nil
    elsif Rails.env.production?
      execute <<-SQL
        ALTER TABLE dogs
        ALTER COLUMN hair_length
        TYPE integer
        USING CAST(hair_length AS integer)
      SQL
    end
  end
end
