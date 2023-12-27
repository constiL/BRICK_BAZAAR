class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :bricks
  has_many :chatrooms_as_buyer, class_name: "Chatroom", foreing_key: "buyer_id", dependent: :destroy
  has_many :chatrooms_as_seller, class_name: "Chatroom", foreing_key: "seller_id", dependent: :destroy

  has_many :buy_requests

  validates :username, presence: true, uniqueness:true
  validates :username, length: { minimum: 3 }
end
