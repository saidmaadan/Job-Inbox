require "rails_helper"

describe "Sign In" do 

	it "display email and password fields" do 

		visit root_url

		click_link "Sign In"

		expect(current_path).to eq(signin_path)
	end

	it "authenticate candidate with valid email and password" do
		candidate = Candidate.create!(candidate_attributes)

		visit root_url

		click_link 'Sign In'

		# fill_in "Email", with: candidate.email
		# fill_in "Password", with: candidate.password

		click_button 'Sign In'

		expect(current_path).to eq(candidate_path(candidate))   
	end

	it "does not authenticate candidate if email and password is invalid" do
	  candidate = Candidate.create!(candidate_attributes)

	  visit root_url

	  click_link 'Sign In'

	  # fill_in "Email", with: candidate.email
	  # fill_in "Password", with: "un match password"

	  click_button 'Sign In'

	  expect(page).to have_text('Invalid')
	end

	it "authenticate employer with valid email and password" do
		employer = Employer.create!(employer_attributes)

		visit root_url

		click_link 'Sign In'

		# fill_in "Email", with: employer.email
		# fill_in "Password", with: employer.password

		click_button 'Sign In'

		expect(current_path).to eq(employer_path(employer))   
	end

	it "does not authenticate employer if email and password is invalid" do
	  employer = Employer.create!(employer_attributes)

	  visit root_url

	  click_link 'Sign In'

	   # fill_in "Email", with: employer.email
	   # fill_in "Password", with: "un match password"

	  click_button 'Sign In'

	  expect(page).to have_text('Invalid')
	end
end

