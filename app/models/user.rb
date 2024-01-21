class User < ApplicationRecord
  authenticates_with_sorcery!

  #認証関係のバリデーション
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true

  #他テーブルとの関係性
  has_many :boards, dependent: :destroy
end
