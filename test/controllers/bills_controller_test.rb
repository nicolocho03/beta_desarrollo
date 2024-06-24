require "test_helper"

class BillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get bills_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_url
    assert_response :success
  end

  test "should create bill" do
    assert_difference("Bill.count") do
      post bills_url, params: { bill: { SAO: @bill.SAO, fecha_entrega_compras: @bill.fecha_entrega_compras, fecha_entrega_contabilidad: @bill.fecha_entrega_contabilidad, fecha_entrega_gerencia: @bill.fecha_entrega_gerencia, fecha_entrega_sst: @bill.fecha_entrega_sst, fecha_llegada_recepcion: @bill.fecha_llegada_recepcion, numero_factura: @bill.numero_factura, radicado: @bill.radicado, state_contabilidad_id: @bill.state_contabilidad_id, state_gerencia_id: @bill.state_gerencia_id, state_sst_id: @bill.state_sst_id, tipo_proyecto: @bill.tipo_proyecto } }
    end

    assert_redirected_to bill_url(Bill.last)
  end

  test "should show bill" do
    get bill_url(@bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_url(@bill)
    assert_response :success
  end

  test "should update bill" do
    patch bill_url(@bill), params: { bill: { SAO: @bill.SAO, fecha_entrega_compras: @bill.fecha_entrega_compras, fecha_entrega_contabilidad: @bill.fecha_entrega_contabilidad, fecha_entrega_gerencia: @bill.fecha_entrega_gerencia, fecha_entrega_sst: @bill.fecha_entrega_sst, fecha_llegada_recepcion: @bill.fecha_llegada_recepcion, numero_factura: @bill.numero_factura, radicado: @bill.radicado, state_contabilidad_id: @bill.state_contabilidad_id, state_gerencia_id: @bill.state_gerencia_id, state_sst_id: @bill.state_sst_id, tipo_proyecto: @bill.tipo_proyecto } }
    assert_redirected_to bill_url(@bill)
  end

  test "should destroy bill" do
    assert_difference("Bill.count", -1) do
      delete bill_url(@bill)
    end

    assert_redirected_to bills_url
  end
end
