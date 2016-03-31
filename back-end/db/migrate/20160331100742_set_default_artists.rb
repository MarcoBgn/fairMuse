class SetDefaultArtists < ActiveRecord::Migration
	def self.up
		change_column :artists, :balance, :decimal, default: 0, precision: 8,  scale: 2 
	end

	def self.down
		raise ActiveRecord::IrreversibleMigration, "can't remove default"
	end
end
