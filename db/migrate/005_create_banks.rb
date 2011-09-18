class CreateBanks < ActiveRecord::Migration
  def self.up
    create_table :banks do |t|
        t.column :name, :string, :null => false
    end
  end

  def self.down
    drop_table :banks
  end
end
