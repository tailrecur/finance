class CreateMutualFundInvestments < ActiveRecord::Migration
  def self.up
    create_table :mutual_fund_investments do |t|
        t.column :mutual_fund_id, :integer, :null => false
        t.column :units, :decimal, :precision => 12, :scale => 4, :null => false
        t.column :buying_price, :decimal, :precision => 12, :scale => 4, :null => false
        t.column :buying_value, :decimal, :precision => 12, :scale => 4, :null => false
        t.column :purchase_date, :date, :null => false
        t.column :current_value, :decimal, :precision => 12, :scale => 4
        t.column :sale_price, :decimal, :precision => 12, :scale => 4
        t.column :sale_value, :decimal, :precision => 12, :scale => 4
        t.column :sale_date, :date
        t.column :absolute_returns, :decimal, :precision => 10, :scale => 2
        t.column :annualized_returns, :decimal, :precision => 10, :scale => 2
    end
  end

  def self.down
    drop_table :mutual_fund_investments
  end
end
