def job_attributes(overrides = {})
	{
		 company: "SpiceWorks", 
		 title: "Ruby on Rails",
		 description: "You'll be part of a team that builds 
		 tools that power our games. We're looking for Tools 
		 Developers who are capable and excited about finding 
		 creative, efficient and effective solutions to deploy 
		 and manage technologies for our global market.",
		 skill: "Htlm, css, Ruby, Rails",
		 location: "Austin",
		 state: "NYC",
	   country: "USA",
	   experience: "Mid-level",
	   employment_type: "Full Time",
	   job_link: "https://www.app-cubator.com/jobs/12-software-engineer-tools-developer"
	}.merge(overrides)
end

def employer_attributes(overrides = {})
	{
		name: "Employer Name",
		username: "myusername",
		email: "employer@example.com",
		password: "password",
		password_confirmation: "password"
	}.merge(overrides)
end

def candidate_attributes(overrides = {})
	{
		name: "Candidate Name",
		username: "myusername",
		email: "candidate@example.com",
		password: "password",
		password_confirmation: "password"
	}.merge(overrides)
end

def sign_in(candidate)
  visit new_session_url
  fill_in "Email", with: candidate.email
  fill_in "Password", with: candidate.password
  click_button "Sign In"
end

def sign_in(employer)
  visit new_session_url
  fill_in "Email", with: employer.email
  fill_in "Password", with: employer.password
  click_button "Sign In"
end