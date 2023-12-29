class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_one :brick, through: :chatroom

  # validates :content, presence: true, length: { minimum: 5,
  #   message: "Your message needs to be atleast 5 letters"}
  validates :user, presence: true
  validates :brick, presence: true
  validates :chatroom, presence: true
end
