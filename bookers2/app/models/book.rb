class Book < ApplicationRecord
  validates :opinion, length: { maximum: 200 }
  validates :title, presence: true
  validates :opinion, presence: true
  belongs_to :user
end
