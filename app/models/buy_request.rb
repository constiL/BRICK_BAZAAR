class BuyRequest < ApplicationRecord
  belongs_to :user
  belongs_to :brick

  validates :user, :brick, presence: true
  validates :user_id, uniqueness: { scope: :brick_id, message: "Already made a buy request for this brick" }
  validate :cannot_buy_own_brick

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }

  private

  def cannot_buy_own_brick
    if user && brick && user.id == brick.user_id
      errors.add(:base, "Cannot buy your own brick")
    end
  end
end
