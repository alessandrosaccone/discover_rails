class Language < ApplicationRecord
    validates :name, uniqueness: true
    has_and_belongs_to_many :users, optional:true
end
