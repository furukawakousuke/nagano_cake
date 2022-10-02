class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details,dependent: :destroy
  
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: {'入金待ち':'入金待ち', '入金確認':'入金確認','製作中':'製作中','発送準備中':'発送準備中', '発送済み':'発送済み' }
  
  
  
  
  
end
