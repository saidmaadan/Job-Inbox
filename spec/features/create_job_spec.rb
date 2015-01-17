require 'rails_helper'

describe "Create new job" do 
	it "create new job, save and redirect to job details page" do 
        
		visit jobs_url

		click_link "Post a Job"

		expect(current_path).to eq(jobs_post_path)

		fill_in "Company", with: "Company Name"
		fill_in "Title", with: "New Job Post"
		fill_in "Description", with: "Ruby on Rails Developer in Austin Texas"
		fill_in "Skill", with: "HTML, CSS, Ruby"
		fill_in "Location", with: "Austin"
		fill_in "Job Link", with: "https://www.app-cubator.com/jobs/12-software-engineer-tools-developer"

		# fill_in "State", with: "Texas"
		# fill_in "Country", with: "USA"
		select "Internship", from: "job_experience"
		select "Full Time", from: "job_employment_type"

		click_button "Create Job"

		expect(current_path).to eq(jobs_path(@job))
		expect(page).to have_text("Job successfully created!")

		#expect(page).to have_text("New Job Post")
	end
end
