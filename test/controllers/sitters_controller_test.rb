require 'test_helper'

class SittersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sitters_index_url
    assert_response :success
  end

  test "should get show" do
    get sitters_show_url
    assert_response :success
  end

end
