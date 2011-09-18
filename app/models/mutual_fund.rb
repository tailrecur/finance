class MutualFund < ActiveRecord::Base
    validates_inclusion_of :fund_type, :in => ["ELSS","Debt", "Gilt", "Liquid"]

    has_many :mutual_fund_investments
    has_many :sips
end
