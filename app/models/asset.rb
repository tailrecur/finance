class Asset < ActiveRecord::Base

    def self.get_investments
        assets = Asset.find(:all)
        investments = []
        for asset in assets
            investments << Investment.new(:name => asset.name, :value => asset.value, :params => {:controller => "asset"},
                    :liquid => asset.liquid, :equity => asset.equity)
        end
        return investments
    end
end
