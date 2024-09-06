class AddProjectTypeIdToBills < ActiveRecord::Migration[7.1]
  def change
    add_column :bills, :project_type_id, :bigint
    add_foreign_key :bills, :project_types
    remove_column :bills, :tipo_proyecto, :string
  end
end
