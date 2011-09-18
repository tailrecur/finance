class MutualFundInvestmentController < ApplicationController
    active_scaffold do |config|
        config.actions = [:create, :list, :update]
        config.columns << :fund_type
        config.columns << :current_price
        config.list.columns = [:mutual_fund, :fund_type, :purchase_date, :units, :buying_price, :buying_value, :current_price, :current_value, :dividends, :absolute_returns, :annualized_returns]
        config.create.columns = [:mutual_fund, :units,  :buying_price, :buying_value, :purchase_date]
        config.update.columns = [:mutual_fund, :units,  :buying_price, :buying_value, :purchase_date, :sale_price, :sale_value, :sale_date]
        config.columns[:mutual_fund].ui_type = :select
        config.columns[:dividends].includes = nil
        config.list.sorting = {:purchase_date => :asc}
        config.list.per_page = 100
    end

    def conditions_for_collection
        @condition = "sale_date is null" if @condition.nil?
        return @condition                                           
    end

    def method_missing type
        if type == "all" 
            @condition = ""
        else
            @condition = ["fund_type = ? and sale_date is null", type]
        end
        index
    end
end
