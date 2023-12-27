class BuyRequest < ApplicationRecord
  validates :user, :brick, presence: true
  validates :user_id, uniqueness: {scope: :brick_id, notice: "Only one request per brick"}

  belongs_to :user
  belongs_to :brick

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
