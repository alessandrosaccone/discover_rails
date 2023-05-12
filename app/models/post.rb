class Post < ApplicationRecord
    before_create :set_persone_rimanenti_default
    belongs_to :user, foreign_key: 'user_email', primary_key: 'email'
    
    private 
    def set_persone_rimanenti_default
        self.persone_rimanenti = self.persone
    end
end
