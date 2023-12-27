class Chatroom < ApplicationRecord
  belongs_to :brick
  has_many :messages, dependent: :destroy
end
