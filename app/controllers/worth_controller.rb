class WorthController < ApplicationController
    @@investment_types = [Asset, BankAccount, FixedDeposit, Sip, MutualFundInvestment]

    verify :post => :update_data

    def index
        @investments = []
        for investment_type in @@investment_types
            @investments += investment_type.get_investments
        end

        @total_amount = 0
        @liquid_amount = 0
        @equity_amount = 0
        for investment in @investments
            @liquid_amount += investment.attributes[:value] if investment.attributes[:liquid]
            @equity_amount += investment.attributes[:value] if investment.attributes[:equity]
            @total_amount += investment.attributes[:value]
        end
    end
end
