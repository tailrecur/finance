class MutualFundController < ApplicationController
    active_scaffold do |config|
        config.list.per_page = 100
        config.actions = [:create, :list, :update, :delete]
        config.columns = [:amfi_symbol, :name, :fund_type, :nav]
    end

    def refresh_data
        refresh_prices
        redirect_to(:action =>'index')
    end
end
