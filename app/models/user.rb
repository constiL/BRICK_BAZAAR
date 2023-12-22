class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness:true
  validates :username, length: { minimum: 3 }
  
  has_many :bricks
  has_many :messages
  has_many :buy_requests
end
