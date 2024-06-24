require "test_helper"

class SpecificStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specific_state = specific_states(:one)
  end

  test "should get index" do
    get specific_states_url
    assert_response :success
  end

  test "should get new" do
    get new_specific_state_url
    assert_response :success
  end

  test "should create specific_state" do
    assert_difference("SpecificState.count") do
      post specific_states_url, params: { specific_state: { nombre: @specific_state.nombre, ubication_id: @specific_state.ubication_id } }
    end

    assert_redirected_to specific_state_url(SpecificState.last)
  end

  test "should show specific_state" do
    get specific_state_url(@specific_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_specific_state_url(@specific_state)
    assert_response :success
  end

  test "should update specific_state" do
    patch specific_state_url(@specific_state), params: { specific_state: { nombre: @specific_state.nombre, ubication_id: @specific_state.ubication_id } }
    assert_redirected_to specific_state_url(@specific_state)
  end

  test "should destroy specific_state" do
    assert_difference("SpecificState.count", -1) do
      delete specific_state_url(@specific_state)
    end

    assert_redirected_to specific_states_url
  end
end
