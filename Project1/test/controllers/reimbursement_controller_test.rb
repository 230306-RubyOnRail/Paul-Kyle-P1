require "test_helper"

class ReimbursementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reimbursement_index_url
    assert_response :success
  end

  test "should get create" do
    get reimbursement_create_url
    assert_response :success
  end

  test "should get show" do
    get reimbursement_show_url
    assert_response :success
  end

  test "should get update" do
    get reimbursement_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reimbursement_destroy_url
    assert_response :success
  end
end
