class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  attachment :profile_image
  has_many :books

  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 20 } 
  validates :opinion, length: { maximum: 50 } 
  validates :name, absence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
