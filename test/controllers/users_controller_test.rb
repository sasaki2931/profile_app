require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest


  test "newページ" do
    get new_skill_url
    assert_response :success
  end

  test "editページ" do
    get edit_skill_path
    assert_response :success
  end

end

