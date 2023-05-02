class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable
  belongs_to :role, :optional => true

  def tourist?
    role.name == 'Tourist'
  end

  def guide?
    role.name == 'Guide'
  end
  
  def default_role
    role = Role.find(9)
    self.role << role
  end


end
