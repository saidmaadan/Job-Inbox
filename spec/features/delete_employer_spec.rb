require "rails_helper"

describe "Destroy Employer" do 

	it "destroy and sign out the employer" do 
		employer = Employer.create!(employer_attributes)

		sign_in(employer)

		visit employer_path(employer)

		click_link "Delete Account"

		expect(page).to have_link("Sign In")
		expect(page).not_to have_link("Sign Out")
	end
end