class AddUbicationIdAndStateIdToBills < ActiveRecord::Migration[6.0]
  def change
    add_reference :bills, :ubication, foreign_key: true
    add_reference :bills, :state, foreign_key: { to_table: :general_states }
  end
end

