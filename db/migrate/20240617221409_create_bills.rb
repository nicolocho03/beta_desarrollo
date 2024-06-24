class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.string :radicado
      t.string :SAO
      t.string :numero_factura
      t.date :fecha_llegada_recepcion
      t.date :fecha_entrega_compras
      t.date :fecha_entrega_sst
      t.date :fecha_entrega_gerencia
      t.date :fecha_entrega_contabilidad
      t.references :state_gerencia, null: true, foreign_key: { to_table: :specific_states }
      t.references :state_contabilidad, null: true, foreign_key: { to_table: :specific_states }
      t.references :state_sst, null: true, foreign_key: { to_table: :specific_states }
      t.string :tipo_proyecto

      t.timestamps
    end
  end
end
