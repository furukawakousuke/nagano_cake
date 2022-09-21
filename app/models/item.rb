class Item < ApplicationRecord

  belongs_to :genre


  enum is_active: { "販売中": true, "販売停止中": false }
  validates :is_active, inclusion: {in: ["販売中", "販売停止中"]}

  def add_tax_price
        (self.price * 1.10).round
  end

  has_one_attached :image
  
  
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
