require File.dirname(__FILE__) + '/../test_helper'

class MutualFundInvestmentTest < Test::Unit::TestCase
    fixtures :mutual_fund_investments, :mutual_funds, :dividends

    def setup
        fund = mutual_fund_investments(:elss_purchase)
        fund.current_value = nil
        fund.absolute_returns = nil
        fund.purchase_date = Date.today - 365 * 2
        fund.save
    end

    def test_updates_current_value
        fund = mutual_fund_investments(:elss_purchase)
        assert_in_delta 1822.5, fund.update_current_value, 0.001
    end

    def test_update_absolute_returns
        fund = mutual_fund_investments(:elss_purchase)
        temp = fund.update_absolute_returns
        assert_in_delta 11.921, temp, 0.001
    end

    def test_update_annualized_returns
        fund = mutual_fund_investments(:elss_purchase)
        assert_in_delta 5.793, fund.update_annualized_returns, 0.001
    end

    def test_update_calculations
        MutualFundInvestment.update_calculations
        fund = mutual_fund_investments(:elss_purchase)
        retrieved_fund = MutualFundInvestment.find(fund.id)
        assert_not_nil retrieved_fund.current_value
        assert_not_nil retrieved_fund.absolute_returns
        assert_not_nil retrieved_fund.annualized_returns
    end
end
