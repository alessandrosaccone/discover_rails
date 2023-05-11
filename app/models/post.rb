class Post < ApplicationRecord
    before_create :set_persone_rimanenti_default

    private 
    def set_persone_rimanenti_default
        self.persone_rimanenti = self.persone
    end
end
