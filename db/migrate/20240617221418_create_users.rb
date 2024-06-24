class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nombre_usuario
      t.string :password
      t.references :ubication, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: { to_table: :general_states }

      t.timestamps
    end
  end
end
