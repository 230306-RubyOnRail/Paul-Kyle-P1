require "test_helper"

class PersonnelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get personnel_index_url
    assert_response :success
  end

  test "should get create" do
    get personnel_create_url
    assert_response :success
  end

  test "should get show" do
    get personnel_show_url
    assert_response :success
  end

  test "should get update" do
    get personnel_update_url
    assert_response :success
  end

  test "should get destroy" do
    get personnel_destroy_url
    assert_response :success
  end
end
