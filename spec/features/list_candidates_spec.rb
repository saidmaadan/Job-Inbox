require 'rails_helper'

describe "All register candidates" do
  
  it "display list of candidates" do
    candidate1 = Candidate.create!(candidate_attributes(name: "Fola Abe", email: "said@example.com", username: "folaabe",))
    candidate2 = Candidate.create!(candidate_attributes(name: "Biola Awe",   email: "biola@example.com", username: "biolaawe3",))
    candidate3 = Candidate.create!(candidate_attributes(name: "Peju Ogun", email: "peju@example.com", username: "pejuogun4",))
    candidate4 = Candidate.create!(candidate_attributes(name: "Steve Baba", email: "steve@example.com",username: "stevemike",))
    
    sign_in(candidate1)
    
    visit candidates_url
    
    expect(page).to have_link(candidate1.name)
    expect(page).to have_link(candidate2.name)
    expect(page).to have_link(candidate3.name)
    expect(page).to have_link(candidate4.name)
  end 
end
