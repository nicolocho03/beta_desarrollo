class RemoveUbicationIdAndStateIdFromBills < ActiveRecord::Migration[7.1]
  def change
    remove_column :bills, :ubication_id, :integer
    remove_column :bills, :state_id, :integer
  end
end
