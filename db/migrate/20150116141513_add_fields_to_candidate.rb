class AddFieldsToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :username, :string
    add_column :candidates, :about, :text
    add_column :candidates, :accomplish, :text
    add_column :candidates, :powerpoint, :text
    add_column :candidates, :specialization, :text
    add_column :candidates, :location, :string
    add_column :candidates, :sex, :string
    add_column :candidates, :phone, :string
    add_column :candidates, :school, :string
    add_column :candidates, :work, :string
    add_column :candidates, :marital, :string
    add_column :candidates, :github, :string
    add_column :candidates, :twitter, :string
    add_column :candidates, :linkedin, :string
    add_column :candidates, :dribbble, :string
    add_column :candidates, :facebook, :string
    add_column :candidates, :degree, :string
    add_column :candidates, :start_year, :string
    add_column :candidates, :grad_year, :string
  end
end
