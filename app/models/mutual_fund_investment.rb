class MutualFundInvestment < ActiveRecord::Base
    has_many :dividends

    belongs_to :mutual_fund

    def self.update_calculations
        MutualFundInvestment.transaction do
#            for fund_investment in MutualFundInvestment.find(:all, :order => "id", :limit => 1, :offset => 5)
            for fund_investment in MutualFundInvestment.find(:all)
                fund_investment.update_current_value
                fund_investment.update_absolute_returns
                fund_investment.update_annualized_returns
                fund_investment.save
            end
        end
    end

    def update_current_value
        self.current_value = units * mutual_fund.nav
    end

    def update_absolute_returns
        update_current_value
        self.absolute_returns = (((current_value + get_dividends) - buying_value) / buying_value) * 100
    end

    def get_dividends
        total = dividends.sum(:value)
        !total.nil? ? total : 0
    end

    def update_annualized_returns
        update_current_value
        period = (Date.today - purchase_date)/365
        power = (Math.log(current_value + get_dividends) - Math.log(buying_value)) / period
        self.annualized_returns = (Math.exp(power) - 1) * 100
    end

    def self.get_investments
        investments = []
        mf_investments = MutualFundInvestment.sum(:current_value,
                :joins => "as mfi inner join mutual_funds mf on mfi.mutual_fund_id = mf.id",
                :conditions => "sale_date is null",
                :group => "mf.fund_type")

        for investment in mf_investments
            investments << Investment.new(:name=>investment[0], :value=>investment[1], :params => {:controller => "mutual_fund_investment", :action => investment[0]},
                    :liquid => ["Debt","Gilt", "Liquid"].include?(investment[0]), :equity => ["ELSS", "Gilt", "Liquid"].include?(investment[0]))
        end
        return investments
    end

    def fund_type
        mutual_fund.fund_type
    end

    def current_price
        mutual_fund.nav
    end

    def to_label
        mutual_fund.name + " " + purchase_date.to_s
    end
end
