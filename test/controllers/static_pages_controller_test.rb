require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should test about" do
    get '/static_pages/about'
    assert_response :success
  end
end
