require "rails_helper"

describe "Navigate between the pages" do 

	it "show navigation link from details page to listing page" do 
		job = Job.create(job_attributes)

		visit job_path(job)

		click_link "All Jobs"

		expect(current_path).to eq(jobs_path)
	end

	it "show navigation link from listing page to details page" do 
		job = Job.create(job_attributes)

		visit jobs_path

		click_link job.title

		expect(current_path).to eq(job_path(job))
	end
end
