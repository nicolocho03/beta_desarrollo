json.extract! bill, :id, :radicado, :SAO, :numero_factura, :fecha_llegada_recepcion, :fecha_entrega_compras, :fecha_entrega_sst, :fecha_entrega_gerencia, :fecha_entrega_contabilidad, :state_gerencia_id, :state_contabilidad_id, :state_sst_id, :tipo_proyecto, :created_at, :updated_at
json.url bill_url(bill, format: :json)
