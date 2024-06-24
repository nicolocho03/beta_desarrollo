require "application_system_test_case"

class UbicationsTest < ApplicationSystemTestCase
  setup do
    @ubication = ubications(:one)
  end

  test "visiting the index" do
    visit ubications_url
    assert_selector "h1", text: "Ubications"
  end

  test "should create ubication" do
    visit ubications_url
    click_on "New ubication"

    fill_in "Nombre", with: @ubication.nombre
    click_on "Create Ubication"

    assert_text "Ubication was successfully created"
    click_on "Back"
  end

  test "should update Ubication" do
    visit ubication_url(@ubication)
    click_on "Edit this ubication", match: :first

    fill_in "Nombre", with: @ubication.nombre
    click_on "Update Ubication"

    assert_text "Ubication was successfully updated"
    click_on "Back"
  end

  test "should destroy Ubication" do
    visit ubication_url(@ubication)
    click_on "Destroy this ubication", match: :first

    assert_text "Ubication was successfully destroyed"
  end
end
