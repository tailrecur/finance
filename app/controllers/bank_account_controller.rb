class BankAccountController < ApplicationController
    active_scaffold do |config|
        config.actions = [:create, :list, :update]
        config.columns = [:bank, :name, :number, :balance]
        config.columns[:bank].ui_type = :select
    end
end
