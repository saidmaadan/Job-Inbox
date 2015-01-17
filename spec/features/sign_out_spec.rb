require "rails_helper"

describe "Sign Out" do 

	it "destroy the candidate id from the session" do 
		candidate = Candidate.create!(candidate_attributes)

		sign_in(candidate)

		click_link "Sign Out"

		expect(page).to have_text("signed out")
		expect(page).not_to have_link("Sign Out")
		expect(page).to have_link("Sign In")
	end

	it "destroy the employer id from the session" do 
		employer = Employer.create!(employer_attributes)

		sign_in(employer)

		click_link "Sign Out"

		expect(page).to have_text("signed out")
		expect(page).not_to have_link("Sign Out")
		expect(page).to have_link("Sign In")
	end
end