
class Country < ApplicationRecord
    has_many :cities
    validates :name, uniqueness: true
  end
  