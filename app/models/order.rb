class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Check", "Credit Cart", "Purchase Order"]

  validates :name, :address, :email, presence: true

end
