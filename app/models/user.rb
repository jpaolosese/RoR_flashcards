class User < ApplicationRecord
  has_many :decks, dependent: :destroy
end
