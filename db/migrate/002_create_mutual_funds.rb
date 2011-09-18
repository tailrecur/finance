class CreateMutualFunds < ActiveRecord::Migration
  def self.up
    create_table :mutual_funds do |t|
        t.column :fund_type, :string, :null => false
        t.column :amfi_symbol, :string, :null => false
        t.column :name, :string, :null => false
        t.column :nav, :decimal, :precision => 12, :scale => 4
    end
  end

  def self.down
    drop_table :mutual_funds
  end
end
