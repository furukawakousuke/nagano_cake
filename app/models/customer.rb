class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :orders,dependent: :destroy



        has_many :addresses,dependent: :destroy
        has_many :cart_items,dependent: :destroy

        validates:first_name, presence:true
        validates:last_name, presence:true
        validates:telephone_number, presence:true


  def full_name
   [ first_name,last_name].join('')
  end


  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end