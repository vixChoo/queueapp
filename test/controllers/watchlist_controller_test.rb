require 'test_helper'

class WatchlistControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "should get index" do
    get watchlist_index_url
    assert_response :success
  end

>>>>>>> 5795ad14dfa370c43915e07bb46657ee7fd34ded
end
