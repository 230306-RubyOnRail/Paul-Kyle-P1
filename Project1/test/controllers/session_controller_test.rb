require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get session_index_url
    assert_response :success
  end

  test "should get create" do
    get session_create_url
    assert_response :success
  end

  test "should get show" do
    get session_show_url
    assert_response :success
  end

  test "should get update" do
    get session_update_url
    assert_response :success
  end

  test "should get destroy" do
    get session_destroy_url
    assert_response :success
  end
end
