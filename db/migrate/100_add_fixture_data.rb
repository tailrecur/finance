class AddFixtureData < ActiveRecord::Migration
    def self.up
        load_model "assets.yml", Asset
        load_model "banks.yml", Bank
        load_model "bank_accounts.yml", BankAccount
        load_model "fixed_deposits.yml", FixedDeposit
        load_model "mutual_funds.yml", MutualFund
        load_model "mutual_fund_investments.yml", MutualFundInvestment
        load_model "sips.yml", Sip
        load_model "dividends.yml", Dividend
    end

    def self.load_model file_name, model_name
        filename = File.join(File.dirname(__FILE__), "../../test/fixtures/"+file_name)
        YAML.load_file(filename).each {|key, value| model_name.create(value)}
    end

    def self.down
        MutualFundInvestment.delete_all
        MutualFund.delete_all
        FixedDeposit.delete_all
        BankAccount.delete_all
        Bank.delete_all
        Asset.delete_all
        Sip.delete_all
        Dividend.delete_all
    end
end

