class AddFieldsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :industry, :string
    add_column :jobs, :company_size, :string
    add_column :jobs, :website, :string
    add_column :jobs, :key_responsibility, :text
    add_column :jobs, :state, :string
    add_column :jobs, :zip_code, :string
    add_column :jobs, :country, :string
    add_column :jobs, :salary, :string
    add_column :jobs, :salary_rate, :string
    add_column :jobs, :employment_type, :string
    add_column :jobs, :experience, :string
    add_column :jobs, :relocation, :string
    add_column :jobs, :travel, :string
    add_column :jobs, :other_pay, :text
    add_column :jobs, :job_link, :text
  end
end
