require File.dirname(__FILE__) + '/../test_helper'

class MutualFundTest < Test::Unit::TestCase
  fixtures :mutual_funds

  def test_invalid_fund_type_throws_error
      fund = MutualFund.create(
              :type => "invalid",
              :name => "Test")

      assert !fund.valid?
  end
end
