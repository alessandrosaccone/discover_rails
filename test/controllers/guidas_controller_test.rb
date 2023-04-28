require "test_helper"

class GuidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guida = guidas(:one)
  end

  test "should get index" do
    get guidas_url
    assert_response :success
  end

  test "should get new" do
    get new_guida_url
    assert_response :success
  end

  test "should create guida" do
    assert_difference("Guida.count") do
      post guidas_url, params: { guida: {  } }
    end

    assert_redirected_to guida_url(Guida.last)
  end

  test "should show guida" do
    get guida_url(@guida)
    assert_response :success
  end

  test "should get edit" do
    get edit_guida_url(@guida)
    assert_response :success
  end

  test "should update guida" do
    patch guida_url(@guida), params: { guida: {  } }
    assert_redirected_to guida_url(@guida)
  end

  test "should destroy guida" do
    assert_difference("Guida.count", -1) do
      delete guida_url(@guida)
    end

    assert_redirected_to guidas_url
  end
end
