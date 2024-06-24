class CreateGeneralStates < ActiveRecord::Migration[7.1]
  def change
    create_table :general_states do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
