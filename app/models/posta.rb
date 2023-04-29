class Posta < ApplicationRecord
    belongs_to :guidas, foreign_key: "email"
end
