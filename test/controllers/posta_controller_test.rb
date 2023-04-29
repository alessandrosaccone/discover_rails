require "test_helper"

class PostaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @postum = posta(:one)
  end

  test "should get index" do
    get posta_url
    assert_response :success
  end

  test "should get new" do
    get new_postum_url
    assert_response :success
  end

  test "should create postum" do
    assert_difference("Postum.count") do
      post posta_url, params: { postum: {  } }
    end

    assert_redirected_to postum_url(Postum.last)
  end

  test "should show postum" do
    get postum_url(@postum)
    assert_response :success
  end

  test "should get edit" do
    get edit_postum_url(@postum)
    assert_response :success
  end

  test "should update postum" do
    patch postum_url(@postum), params: { postum: {  } }
    assert_redirected_to postum_url(@postum)
  end

  test "should destroy postum" do
    assert_difference("Postum.count", -1) do
      delete postum_url(@postum)
    end

    assert_redirected_to posta_url
  end
end
