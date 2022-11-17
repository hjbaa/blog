require "test_helper"

class DiaryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diary_index_url
    assert_response :success
  end

  test "should get create" do
    get diary_create_url
    assert_response :success
  end

  test "should get new" do
    get diary_new_url
    assert_response :success
  end

  test "should get show" do
    get diary_show_url
    assert_response :success
  end

  test "should get destroy" do
    get diary_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get diary_edit_url
    assert_response :success
  end

  test "should get update" do
    get diary_update_url
    assert_response :success
  end
end
