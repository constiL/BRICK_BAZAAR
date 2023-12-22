class Brick < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :buy_requests
  
end
