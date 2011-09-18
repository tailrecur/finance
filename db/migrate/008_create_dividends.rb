class CreateDividends < ActiveRecord::Migration
    def self.up
        create_table :dividends do |t|
            t.column :mutual_fund_investment_id, :integer, :null => false
            t.column :value, :decimal, :precision => 12, :scale => 4, :null => false
            t.column :date, :date, :null => false
        end
    end

    def self.down
        drop_table :dividends
    end
end
