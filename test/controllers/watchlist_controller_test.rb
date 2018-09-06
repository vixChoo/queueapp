require 'test_helper'

class WatchlistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get watchlist_index_url
    assert_response :success
  end

end
