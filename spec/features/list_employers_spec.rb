require 'rails_helper'

describe "All register employers" do
  
  it "display list of employers" do
    employer1 = Employer.create!(employer_attributes(name: "Said", email: "said@example.com",username: "said234",))
    employer2 = Employer.create!(employer_attributes(name: "Biola",   email: "biola@example.com",username: "biola345",))
    employer3 = Employer.create!(employer_attributes(name: "Peju", email: "peju@example.com",username: "peju567",))
    employer4 = Employer.create!(employer_attributes(name: "Steve", email: "steve@example.com",username: "steven234",))
    
    sign_in(employer1)
    
    visit employers_url
    
    expect(page).to have_link(employer1.name)
    expect(page).to have_link(employer2.name)
    expect(page).to have_link(employer3.name)
    expect(page).to have_link(employer4.name)
  end 
end
