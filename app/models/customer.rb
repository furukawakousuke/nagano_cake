class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :orders,dependent: :destroy
        
          
         enum is_deleted: { "有効": true, "退会": false }
  validates :is_deleted, inclusion: {in: ["有効", "退会"]}
         
  def full_name
   [ first_name,last_name].join('')
  end
end