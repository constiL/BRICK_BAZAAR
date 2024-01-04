class BrickCategory < ApplicationRecord
  has_many :bricks
  validates :category, :sub_category, :size, :category_type, presence: true
end
