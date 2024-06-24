class CreateUbications < ActiveRecord::Migration[7.1]
  def change
    create_table :ubications do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
