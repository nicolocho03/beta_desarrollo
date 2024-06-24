class CreateSpecificStates < ActiveRecord::Migration[7.1]
  def change
    create_table :specific_states do |t|
      t.string :nombre
      t.references :ubication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
