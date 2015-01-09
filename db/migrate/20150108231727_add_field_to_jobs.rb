class AddFieldToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :company_description, :text
  end
end
