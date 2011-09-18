class CreateSips < ActiveRecord::Migration
    def self.up
        create_table :sips do |t|
            t.column :mutual_fund_id, :integer, :null => false
            t.column :start_date, :date, :null => false
            t.column :sip_amount, :decimal, :precision => 12, :scale => 4, :null => false
            t.column :units, :decimal, :precision => 12, :scale => 4, :null => false
            t.column :current_value, :decimal, :precision => 12, :scale => 4
            t.column :absolute_returns, :decimal, :precision => 7, :scale => 2
            t.column :annualized_returns, :decimal, :precision => 7, :scale => 2
        end
    end

    def self.down
        drop_table :sips
    end
end
