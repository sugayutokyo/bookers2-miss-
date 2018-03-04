class Book < ApplicationRecord
  validates :opinion, length: { in: 1..100 }
  belongs_to :user
end
