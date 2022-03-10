require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get requester_show" do
    get public_users_requester_show_url
    assert_response :success
  end

  test "should get sns_show" do
    get public_users_sns_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get requester_edit" do
    get public_users_requester_edit_url
    assert_response :success
  end

  test "should get sns_edit" do
    get public_users_sns_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_users_unsubscribe_url
    assert_response :success
  end

  test "should get search" do
    get public_users_search_url
    assert_response :success
  end

  test "should get favorites" do
    get public_users_favorites_url
    assert_response :success
  end

  test "should get sns_favorites" do
    get public_users_sns_favorites_url
    assert_response :success
  end
end
