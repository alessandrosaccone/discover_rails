require "test_helper"

class TuristasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turista = turistas(:one)
  end

  test "should get index" do
    get turistas_index_url
    assert_response :success
  end

  test "should get new" do
    get new_turista_url
    assert_response :success
  end

  test "should create turista" do
    assert_difference("Turistas.count") do
      post turistas_index_url, params: { turista: {  } }
    end

    assert_redirected_to turista_url(Turistas.last)
  end

  test "should show turista" do
    get turista_url(@turista)
    assert_response :success
  end

  test "should get edit" do
    get edit_turista_url(@turista)
    assert_response :success
  end

  test "should update turista" do
    patch turista_url(@turista), params: { turista: {  } }
    assert_redirected_to turista_url(@turista)
  end

  test "should destroy turista" do
    assert_difference("Turistas.count", -1) do
      delete turista_url(@turista)
    end

    assert_redirected_to turistas_index_url
  end
end
