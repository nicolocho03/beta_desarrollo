require "test_helper"

class GeneralStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_state = general_states(:one)
  end

  test "should get index" do
    get general_states_url
    assert_response :success
  end

  test "should get new" do
    get new_general_state_url
    assert_response :success
  end

  test "should create general_state" do
    assert_difference("GeneralState.count") do
      post general_states_url, params: { general_state: { nombre: @general_state.nombre } }
    end

    assert_redirected_to general_state_url(GeneralState.last)
  end

  test "should show general_state" do
    get general_state_url(@general_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_state_url(@general_state)
    assert_response :success
  end

  test "should update general_state" do
    patch general_state_url(@general_state), params: { general_state: { nombre: @general_state.nombre } }
    assert_redirected_to general_state_url(@general_state)
  end

  test "should destroy general_state" do
    assert_difference("GeneralState.count", -1) do
      delete general_state_url(@general_state)
    end

    assert_redirected_to general_states_url
  end
end
