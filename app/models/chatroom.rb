class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :brick
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  validates :brick, presence: true
end
