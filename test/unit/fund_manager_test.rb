require File.dirname(__FILE__) + '/../test_helper'

class FundManagerTest < Test::Unit::TestCase
  fixtures :mutual_funds

  def test_retrieve_prices
      FundManager.refresh_navs
      assert_in_delta 157.2598, MutualFund.find(:first).nav, 0.0001
  end
end
