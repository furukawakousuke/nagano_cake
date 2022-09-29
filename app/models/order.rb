class Order < ApplicationRecord
  
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  
  def shipping_cost
    800
    
  end  
  
  
  
end
