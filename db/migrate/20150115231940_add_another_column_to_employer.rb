class AddAnotherColumnToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :company_name, :string
    
  end
end