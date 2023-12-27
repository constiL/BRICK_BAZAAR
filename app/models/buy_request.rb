class BuyRequest < ApplicationRecord
  belongs_to :user
  belongs_to :brick

  validates :user, :brick, presence: true
  validates :user_id, uniqueness: { scope: :brick_id, message: "You can only make one request per brick" }

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
