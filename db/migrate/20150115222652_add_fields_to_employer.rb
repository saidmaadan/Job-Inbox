class AddFieldsToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :username, :string
    add_column :employers, :about, :text
    add_column :employers, :state, :string
    add_column :employers, :city, :string
    add_column :employers, :zipcode, :string
    add_column :employers, :country, :string
    add_column :employers, :twitter, :string
    add_column :employers, :linkedin, :string
    add_column :employers, :facebook, :string
    add_column :employers, :website, :string
  end
end