class SipController < ApplicationController
    active_scaffold do |config|
        config.actions = [:create, :list, :update, :delete]
        config.columns = [:mutual_fund, :start_date, :sip_amount, :units, :current_value, :annualized_returns]
        config.columns[:mutual_fund].ui_type = :select
    end
end
