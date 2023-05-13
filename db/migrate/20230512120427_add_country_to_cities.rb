class AddCountryToCities < ActiveRecord::Migration[7.0]
  def change
    add_reference :cities, :country, null: true, foreign_key: true
  end
end
