require 'test_helper'

class CompanionshipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get companionship_index_url
    assert_response :success
  end

end
