class AssetController < ApplicationController
    active_scaffold do |config|
        config.actions = [:create, :list, :update]
        config.columns = [:name, :value, :liquid, :equity]
    end
end
