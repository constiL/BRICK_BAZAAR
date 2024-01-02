class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  has_one :brick, through: :chatroom

  validates :user, presence: true
  validates :brick, presence: true
  validates :chatroom, presence: true
end
