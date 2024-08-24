class AddProviderToBills < ActiveRecord::Migration[7.1]
  def change
    add_reference :bills, :provider, null: true, foreign_key: true
  end
end
