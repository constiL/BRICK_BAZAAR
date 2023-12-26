class BuyRequest < ApplicationRecord
  belongs_to :user
  belongs_to :brick

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
