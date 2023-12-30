class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :brick
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  validate :unique_chatroom_per_buyer_seller_brick
  validate :buyer_cannot_be_seller

  private

  # custom validation to check if a buyer already created a chat with the seller for respectice brick
  def unique_chatroom_per_buyer_seller_brick
    # find existing chatroom with respective buyer, seller and brick combination and asign it to custom variable "existing_chatrooms"
    existing_chatroom = Chatroom.find_by(
      buyer: buyer,
      seller: seller,
      brick: brick
    )
    # check if "existing_chatroom" variable contains a chatroom and isnt current instance, otherwise trigger validation and display error message
    if existing_chatroom && existing_chatroom != self
      errors.add(:base, "A chatroom already exists for this buyer, seller, and brick combination")
    end
  end

  # custom validation to make sure that the user cannot create a chat with himself
  def buyer_cannot_be_seller
    if buyer_id == seller_id
      errors.add(:base, "Can't start a chat with yourself")
    end
  end
end
