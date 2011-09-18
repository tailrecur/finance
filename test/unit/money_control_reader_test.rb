require File.dirname(__FILE__) + '/../test_helper'
require 'retrieval/money_control_reader'

class MoneyControlReaderTest < Test::Unit::TestCase
  fixtures :mutual_funds

  def test_retrieve_fund_navs
#      MoneyControlReader.retrieve_fund_navs
      fund = MutualFund.find_by_name("Franklin Templeton Tax Shield")
      assert_in_delta 36.45, fund.nav, 0.001
      FundManager.refresh_navs
      fund = MutualFund.find_by_name("Franklin Templeton Tax Shield")
      assert_in_delta 12.04, fund.nav, 0.001
  end
end
