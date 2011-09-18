require 'util/calculator'

class Sip < ActiveRecord::Base
    belongs_to :mutual_fund

    def self.get_investments
        return  [] << Investment.new(:name => "SIP", :value => Sip.sum(:current_value), :params => {:controller => "sip"},
                :liquid => false, :equity => true)
    end

    def update_current_value
        self.current_value = units * mutual_fund.nav
    end

    def self.update_calculations
        Sip.transaction do
            for sip in Sip.find(:all)
                sip.update_current_value
                sip.update_annualized_returns
                sip.save
            end
        end
    end

    def update_annualized_returns
        periods = (Date.today - start_date) / 30
        self.annualized_returns = Calculator.sip_irr current_value, sip_amount, periods
    end
end
