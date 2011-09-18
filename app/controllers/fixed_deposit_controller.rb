class FixedDepositController < ApplicationController
    active_scaffold do |config|
        config.actions = [:create, :list, :update]
        config.columns = [:bank, :amount, :interest_rate, :start_date, :tenure, :maturity_date, :maturity_value]
        config.columns[:bank].ui_type = :select
    end
end
