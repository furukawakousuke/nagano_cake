class Item < ApplicationRecord
has_one_attached :image
  belongs_to :genre
 has_many :cart_items,dependent: :destroy
 has_many :order_details,dependent: :destroy

  enum is_active: { "販売中": true, "販売停止中": false }
  validates :is_active, inclusion: {in: ["販売中", "販売停止中"]}

  def add_tax_price
        (self.price * 1.10).round
  end
  
  def with_tax_price
    (price * 1.1).floor
  end

  
  
  
  def get_image
    if image.attached?
      image
    else
      'no_image.png'
    end
  end 

  def get_image(height,width)
   unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.png')
     image.attach(io:File.open(file_path),filename: 'default-image.png',content_type: 'image/jpeg')
   end
    image
  end

end
