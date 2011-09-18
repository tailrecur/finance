class Dividend < ActiveRecord::Base
    belongs_to :mutual_fund_investment

    def to_label
        value
    end
end
