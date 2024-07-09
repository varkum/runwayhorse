require "test_helper"

class TripTest < ActiveSupport::TestCase
  test "trip days are computed" do
    assert_equal 1, trips(:one).length
    assert_equal 3, trips(:two).length
  end
  
  test "trip registers as happened" do
    assert trips(:two).has_happened?
    assert_not trips(:four).has_happened?
  end
end
