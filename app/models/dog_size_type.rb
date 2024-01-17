class DogSizeType < ApplicationRecord
    has_many :dogs, dependent: :destroy
end
