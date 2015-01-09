require 'rails_helper'

describe "Create new job" do 
	it "create new job, save and redirect to job details page" do 

		visit jobs_url

		click_link "Post a Job"

		expect(current_path).to eq(new_job_path)

		fill_in "Company", with: "Company Name"
		fill_in "Title", with: "New Job Post"
		fill_in "Description", with: "Ruby on Rails Developer in Austin Texas"
		fill_in "Skill", with: "HTML, CSS, Ruby"
		fill_in "Location", with: "Austin"

		click_button "Create Job"

		expect(current_path).to eq(job_path(Job.last))

		expect(page).to have_text("New Job Post")
	end
end


