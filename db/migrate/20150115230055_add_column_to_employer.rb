class AddColumnToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :heard_us, :string
    
  end
end