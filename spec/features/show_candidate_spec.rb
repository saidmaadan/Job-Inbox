require 'rails_helper'

describe "Candidate Profile Page" do
  
  it "shows the candidate's info page" do
    candidate = Candidate.create!(candidate_attributes)
    
    sign_in(candidate)
                         
    visit candidate_url(candidate)
    
    expect(page).to have_text(candidate.name)
    expect(page).to have_text(candidate.email)
  end
  
end