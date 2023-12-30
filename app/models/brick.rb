class Brick < ApplicationRecord
  has_many :chatrooms, dependent: :destroy
  has_many :buy_requests, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :name, :description, :city, :address, :price, :brick_condition, :colour, :country, :postal_code,
    presence: true
  validates :name, length: { minimum: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 1, only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
