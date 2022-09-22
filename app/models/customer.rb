class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :orders,dependent: :destroy
        
          
         enum is_deleted: { "退会": true, "有効": false }
  validates :is_deleted, inclusion: {in: ["有効", "退会"]}
  
  
  
  
         
  def full_name
   [ first_name,last_name].join('')
  end
  
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end