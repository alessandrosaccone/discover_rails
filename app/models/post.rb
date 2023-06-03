class Post < ApplicationRecord
    before_create :set_persone_rimanenti_default
    belongs_to :user, foreign_key: 'user_email', primary_key: 'email'
    has_many :bookings
    has_many :users, through: :bookings
    validates :data, presence: true
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
    


    def expired?
        status == "expired"
    end

    def average_rating
        ratings.average(:rating_score).to_f
    end
    
    private 
    def set_persone_rimanenti_default
        self.persone_rimanenti = self.persone
    end

end
