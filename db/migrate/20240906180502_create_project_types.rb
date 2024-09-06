class CreateProjectTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :project_types do |t|
      t.string :nombre, null: false

      t.timestamps
    end
  end
end
