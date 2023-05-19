class BachecaGuida < ApplicationRecord
  belongs_to :guida, class_name: 'User'


end
