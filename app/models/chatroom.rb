class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :brick
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  validate :unique_chatroom_per_buyer_seller_brick
  validate :buyer_cannot_be_seller

  private

  def unique_chatroom_per_buyer_seller_brick
    existing_chatroom = Chatroom.find_by(
      buyer: buyer,
      seller: seller,
      brick: brick
    )
    if existing_chatroom && existing_chatroom != self
      errors.add(:base, "A chatroom already exists for this buyer, seller, and brick combination")
    end
  end

  def buyer_cannot_be_seller
    if buyer_id == seller_id
      errors.add(:base, "Cannot start a chat with yourself")
    end
  end
end
