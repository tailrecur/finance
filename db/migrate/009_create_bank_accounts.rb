class CreateBankAccounts < ActiveRecord::Migration
    def self.up
        create_table :bank_accounts do |t|
            t.column :bank_id, :integer, :null=>false
            t.column :number, :string, :null=>false
            t.column :name, :string, :null=>false
            t.column :balance, :decimal, :precision=>12, :scale=>2, :null=>false
        end
    end

    def self.down
        drop_table :bank_accounts
    end
end
