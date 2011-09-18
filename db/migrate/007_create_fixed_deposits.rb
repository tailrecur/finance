class CreateFixedDeposits < ActiveRecord::Migration
  def self.up
    create_table :fixed_deposits do |t|
        t.column :bank_id, :integer, :null => false
        t.column :amount, :decimal, :precision => 10, :scale => 2, :null => false
        t.column :interest_rate, :decimal, :precision => 4, :scale => 2, :null => false
        t.column :start_date, :date,  :null => false
        t.column :tenure, :integer,  :null => false
        t.column :maturity_date, :date,  :null => false
        t.column :maturity_value, :decimal, :precision => 10, :scale => 2, :null => false
    end
  end

  def self.down
    drop_table :fixed_deposits
  end
end
