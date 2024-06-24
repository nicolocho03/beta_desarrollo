require "application_system_test_case"

class GeneralStatesTest < ApplicationSystemTestCase
  setup do
    @general_state = general_states(:one)
  end

  test "visiting the index" do
    visit general_states_url
    assert_selector "h1", text: "General states"
  end

  test "should create general state" do
    visit general_states_url
    click_on "New general state"

    fill_in "Nombre", with: @general_state.nombre
    click_on "Create General state"

    assert_text "General state was successfully created"
    click_on "Back"
  end

  test "should update General state" do
    visit general_state_url(@general_state)
    click_on "Edit this general state", match: :first

    fill_in "Nombre", with: @general_state.nombre
    click_on "Update General state"

    assert_text "General state was successfully updated"
    click_on "Back"
  end

  test "should destroy General state" do
    visit general_state_url(@general_state)
    click_on "Destroy this general state", match: :first

    assert_text "General state was successfully destroyed"
  end
end
