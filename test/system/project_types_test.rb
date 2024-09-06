require "application_system_test_case"

class ProjectTypesTest < ApplicationSystemTestCase
  setup do
    @project_type = project_types(:one)
  end

  test "visiting the index" do
    visit project_types_url
    assert_selector "h1", text: "Project types"
  end

  test "should create project type" do
    visit project_types_url
    click_on "New project type"

    fill_in "Nombre", with: @project_type.nombre
    click_on "Create Project type"

    assert_text "Project type was successfully created"
    click_on "Back"
  end

  test "should update Project type" do
    visit project_type_url(@project_type)
    click_on "Edit this project type", match: :first

    fill_in "Nombre", with: @project_type.nombre
    click_on "Update Project type"

    assert_text "Project type was successfully updated"
    click_on "Back"
  end

  test "should destroy Project type" do
    visit project_type_url(@project_type)
    click_on "Destroy this project type", match: :first

    assert_text "Project type was successfully destroyed"
  end
end
