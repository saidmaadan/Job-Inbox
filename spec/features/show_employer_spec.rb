require 'rails_helper'

describe "Employer Profile Page" do
  
  it "shows the employer's info page" do
    employer = Employer.create!(employer_attributes)
    
    sign_in(employer)
                       
    visit employer_url(employer)
    
    expect(page).to have_text(employer.name)
    expect(page).to have_text(employer.email)
  end
  
end