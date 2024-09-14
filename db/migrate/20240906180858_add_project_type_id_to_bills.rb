class AddProjectTypeIdToBills < ActiveRecord::Migration[7.1]
  def change
    add_column :bills, :project_type_id, :bigint
    add_foreign_key :bills, :project_types
    
  end
end
