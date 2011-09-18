class BankAccount < ActiveRecord::Base
    belongs_to :bank

    def self.get_investments
        bank_accounts = BankAccount.sum(:balance)
        return [] << Investment.new(:name => "Bank Account", :value => bank_accounts, :params => {:controller => "bank_account"},
                :liquid => true, :equity => false)
    end
end
