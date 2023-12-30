class BuyRequest < ApplicationRecord
  belongs_to :user
  belongs_to :brick

  validates :user, :brick, presence: true
  validates :user_id, uniqueness: { scope: :brick_id,
    message: "Already made a buy request for this brick" }
  validate :cannot_buy_own_brick

  # enum to make working with buy request queries more readable and intuitive
  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }

  private

  #custom validation to make sure that user can't create a buy request with for his own bricks
  def cannot_buy_own_brick
    if user && brick && user.id == brick.user_id
      errors.add(:base, "Can buy your own brick")
    end
  end
end
