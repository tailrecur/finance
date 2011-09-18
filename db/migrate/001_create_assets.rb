class CreateAssets < ActiveRecord::Migration
    def self.up
        create_table :assets do |t|
            t.column :name, :string, :null=>false
            t.column :value, :decimal, :precision=>12, :scale=>2, :null=>false
        end
    end

    def self.down
        drop_table :assets
    end
end
