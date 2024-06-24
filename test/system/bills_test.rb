require "application_system_test_case"

class BillsTest < ApplicationSystemTestCase
  setup do
    @bill = bills(:one)
  end

  test "visiting the index" do
    visit bills_url
    assert_selector "h1", text: "Bills"
  end

  test "should create bill" do
    visit bills_url
    click_on "New bill"

    fill_in "Sao", with: @bill.SAO
    fill_in "Fecha entrega compras", with: @bill.fecha_entrega_compras
    fill_in "Fecha entrega contabilidad", with: @bill.fecha_entrega_contabilidad
    fill_in "Fecha entrega gerencia", with: @bill.fecha_entrega_gerencia
    fill_in "Fecha entrega sst", with: @bill.fecha_entrega_sst
    fill_in "Fecha llegada recepcion", with: @bill.fecha_llegada_recepcion
    fill_in "Numero factura", with: @bill.numero_factura
    fill_in "Radicado", with: @bill.radicado
    fill_in "State contabilidad", with: @bill.state_contabilidad_id
    fill_in "State gerencia", with: @bill.state_gerencia_id
    fill_in "State sst", with: @bill.state_sst_id
    fill_in "Tipo proyecto", with: @bill.tipo_proyecto
    click_on "Create Bill"

    assert_text "Bill was successfully created"
    click_on "Back"
  end

  test "should update Bill" do
    visit bill_url(@bill)
    click_on "Edit this bill", match: :first

    fill_in "Sao", with: @bill.SAO
    fill_in "Fecha entrega compras", with: @bill.fecha_entrega_compras
    fill_in "Fecha entrega contabilidad", with: @bill.fecha_entrega_contabilidad
    fill_in "Fecha entrega gerencia", with: @bill.fecha_entrega_gerencia
    fill_in "Fecha entrega sst", with: @bill.fecha_entrega_sst
    fill_in "Fecha llegada recepcion", with: @bill.fecha_llegada_recepcion
    fill_in "Numero factura", with: @bill.numero_factura
    fill_in "Radicado", with: @bill.radicado
    fill_in "State contabilidad", with: @bill.state_contabilidad_id
    fill_in "State gerencia", with: @bill.state_gerencia_id
    fill_in "State sst", with: @bill.state_sst_id
    fill_in "Tipo proyecto", with: @bill.tipo_proyecto
    click_on "Update Bill"

    assert_text "Bill was successfully updated"
    click_on "Back"
  end

  test "should destroy Bill" do
    visit bill_url(@bill)
    click_on "Destroy this bill", match: :first

    assert_text "Bill was successfully destroyed"
  end
end
