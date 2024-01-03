class BrickType < ApplicationRecord
  has_many :bricks
  validates :name, :category, :sub_category, presence: true
  validates :name, uniqueness: { scope: :size,
    message: "Type already exists" }
end
