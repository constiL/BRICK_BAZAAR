class BrickCategory < ApplicationRecord
  validates :category, :sub_category, :size, :category_type, presence: true
end
