class Book < ApplicationRecord
  validates :opinion, length: { in: 1..100 }
end
