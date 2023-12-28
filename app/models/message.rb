class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true, length: { minimum: 5 }
  validates :user, presence: true
  validates :brick, presence: true
  validates :chatroom, presence: true
end
