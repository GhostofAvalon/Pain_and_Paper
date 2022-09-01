require "test_helper"

class BackgroundsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get backgrounds_show_url
    assert_response :success
  end

  test "should get index" do
    get backgrounds_index_url
    assert_response :success
  end
end
