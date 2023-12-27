class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :brick
  belongs_to :chatroom

  validates :content, presence: true, length: { minimum: 5 }
end
