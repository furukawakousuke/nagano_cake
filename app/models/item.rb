class Item < ApplicationRecord
  has_one_attached :image
  
  belongs_to :genre
  
  
  enum is_active: { "販売中": true, "販売停止中": false }
  validates :is_active, inclusion: {in: ["販売中", "販売停止中"]}
  
  
  def add_tax_price
        (self.price * 1.10).round
  end
  

end
