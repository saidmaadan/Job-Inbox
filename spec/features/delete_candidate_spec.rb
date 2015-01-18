require "rails_helper"

describe "Destroy Candidate" do 

	before do
    admin = Candidate.create!(candidate_attributes(admin: true))

    sign_in(admin)
  end

	it "destroy and sign out the candidate" do 
		candidate = Candidate.create!(candidate_attributes)

		# sign_in(candidate)

		visit candidate_path(candidate)

		click_link "Delete Account"

		expect(page).to have_link("Sign In")
		expect(page).not_to have_link("Sign Out")
	end
end