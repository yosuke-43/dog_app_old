class Dog < ApplicationRecord
    validates :breed, presence: true
end
