class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable,:omniauthable, :omniauth_providers => [:facebook]
  belongs_to :role, :optional => true
  belongs_to :city, optional: true
  has_many :user_posts, foreign_key: 'user_email', primary_key: 'email', class_name: 'Post'
  has_and_belongs_to_many :languages, optional:true
  has_many :bookings
  has_many :booked_posts, through: :bookings, source: :post
  
  
  def tourist?
    role.name == 'Tourist'
  end

  def guide?
    role.name == 'Guide'
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end
