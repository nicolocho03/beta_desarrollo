require "application_system_test_case"

class SpecificStatesTest < ApplicationSystemTestCase
  setup do
    @specific_state = specific_states(:one)
  end

  test "visiting the index" do
    visit specific_states_url
    assert_selector "h1", text: "Specific states"
  end

  test "should create specific state" do
    visit specific_states_url
    click_on "New specific state"

    fill_in "Nombre", with: @specific_state.nombre
    fill_in "Ubication", with: @specific_state.ubication_id
    click_on "Create Specific state"

    assert_text "Specific state was successfully created"
    click_on "Back"
  end

  test "should update Specific state" do
    visit specific_state_url(@specific_state)
    click_on "Edit this specific state", match: :first

    fill_in "Nombre", with: @specific_state.nombre
    fill_in "Ubication", with: @specific_state.ubication_id
    click_on "Update Specific state"

    assert_text "Specific state was successfully updated"
    click_on "Back"
  end

  test "should destroy Specific state" do
    visit specific_state_url(@specific_state)
    click_on "Destroy this specific state", match: :first

    assert_text "Specific state was successfully destroyed"
  end
end
