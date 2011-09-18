class FixedDeposit < ActiveRecord::Base
    belongs_to :bank

    def self.get_investments
        fd_investments = FixedDeposit.sum(:amount, :conditions => "maturity_date > now()")
        return [] << Investment.new(:name => "Fixed Deposit", :value => fd_investments, :params => {:controller => "fixed_deposit"},
                :liquid => false, :equity => false)
    end
end
