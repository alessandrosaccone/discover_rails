class City < ApplicationRecord
    validates :name, uniqueness: { scope: :region }
    has_many :users
    belongs_to :country
end
