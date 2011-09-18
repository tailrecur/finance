class AddLiquidAndEquityFlags < ActiveRecord::Migration
  def self.up
      add_column :assets, :liquid, :boolean
      add_column :assets, :equity, :boolean
  end

  def self.down
      remove_column :assets, :liquid
      remove_column :assets, :equity
  end
end
