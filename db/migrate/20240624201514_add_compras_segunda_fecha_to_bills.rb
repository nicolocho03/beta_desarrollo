class AddComprasSegundaFechaToBills < ActiveRecord::Migration[7.1]
  def change
    add_column :bills, :compras_segunda_fecha, :date
  end
end
