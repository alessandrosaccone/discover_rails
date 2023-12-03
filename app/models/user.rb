class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :timeoutable,:omniauthable, :omniauth_providers => [:facebook]#, :confirmable

  has_one_attached :avatar

  has_one :bacheca_guida, dependent: :destroy
  has_one :bacheca_utente, dependent: :destroy

  belongs_to :role, :optional => true
  belongs_to :city, optional: true
  has_many :user_posts, foreign_key: 'user_email', primary_key: 'email', class_name: 'Post', dependent: :destroy
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :languages, optional:true
  has_many :bookings
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :booked_posts, through: :bookings, source: :post, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  
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


  def active_for_authentication?
    super && confirmed?
  end

  def inactive_message
    confirmed? ? super : :unconfirmed
  end
  end
