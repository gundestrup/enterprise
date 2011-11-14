class UpdatePrograms < ActiveRecord::Migration
  def self.up
      add_column :programs, :serialnumber, :string
      add_column :programs, :version, :string
      add_column :programs, :licenses, :integer
      add_column :programs, :description, :text
      add_column :programs, :mac, :boolean
      add_column :programs, :pc, :boolean
      add_column :programs, :linux, :boolean
  end

  def self.down
      remove_column :programs, :serialnumber
      remove_column :programs, :version
      remove_column :programs, :licenses
      remove_column :programs, :description
      remove_column :programs, :mac, :boolean
      remove_column :programs, :pc, :boolean
      remove_column :programs, :linux, :boolean
  end
end
