class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nombre_usuario
      t.integer :ubication_id
      t.integer :state_id

      t.timestamps
    end
  end
end
