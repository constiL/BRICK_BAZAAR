class BuyRequest < ApplicationRecord
  belongs_to :brick
  belongs_to :user
end
