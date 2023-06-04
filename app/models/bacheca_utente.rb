class BachecaUtente < ApplicationRecord
  self.table_name = "bacheca_utentes"
  belongs_to :user, dependent: :destroy
end
