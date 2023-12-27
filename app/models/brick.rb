class Brick < ApplicationRecord
  belongs_to :user
  has_many :chatrooms, dependent: :destroy
  has_many :buy_requests, dependent: :destroy

  validates :name, :description, :city, :address, :price, :brick_condition, :colour, presence: true
  validates :name, length: { minimum: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
