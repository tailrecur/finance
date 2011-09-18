class Bank < ActiveRecord::Base
    has_many :bank_accounts
    has_many :fixed_deposits
end
