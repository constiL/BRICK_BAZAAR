class BuyRequest < ApplicationRecord
  belongs_to :user
  belongs_to :brick

  validates :user, :brick, presence: true
  validates :user_id, uniqueness: { scope: :brick_id, message: "You can only make one request per brick" }
  validate :cannot_request_own_brick

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }

  private

  def cannot_request_own_brick
  end
end
