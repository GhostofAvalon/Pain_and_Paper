require "test_helper"

class CharacteristicsListsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get characteristics_lists_edit_url
    assert_response :success
  end

  test "should get update" do
    get characteristics_lists_update_url
    assert_response :success
  end
end
