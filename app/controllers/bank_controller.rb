class BankController < ApplicationController
    active_scaffold do |config|
        config.actions = [:create, :list, :update, :delete]
    end
end
