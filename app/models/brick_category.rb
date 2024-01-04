class BrickCategory < ApplicationRecord
  has_many :bricks
  validates :category, :sub_category, presence: true
  validate :size_or_type_presence

  private

  def size_or_type_presence
    unless size.present? || type.present?
      errors.add(:base, "size or type is missing")
    end
  end
end
