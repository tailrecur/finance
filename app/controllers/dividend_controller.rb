class DividendController < ApplicationController
    active_scaffold do |config|
        config.actions = [:create, :list, :update, :delete]
        config.columns = [:mutual_fund_investment, :value, :date]
        config.columns[:mutual_fund_investment].ui_type = :select
    end
end
