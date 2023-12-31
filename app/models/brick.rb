class Brick < ApplicationRecord
  has_many :chatrooms, dependent: :destroy
  has_many :buy_requests, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :name, :description, :address, :price, :brick_condition, :colour,
    presence: true
  validates :name, length: { minimum: 5 }
  validates :price, numericality: { greater_than_or_equal_to: 1, only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_colour,
    against: [ :name, :colour ],
    using: {
      tsearch: { prefix: true }
    }
    pg_search_scope :search_full_text, against: {
      title: 'A',
      subtitle: 'B',
      content: 'C'
    }
end
