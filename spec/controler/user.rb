require 'rails_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

   test "newページ" do
    get new_usersl_url
    assert_response :success
  end

   test "showページ" do
    get show_users_url
    assert_response :success
  end

   test "editページ" do
    get edit_users_url
    assert_response :success
  end


end

