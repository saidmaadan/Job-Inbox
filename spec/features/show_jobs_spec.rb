require "rails_helper"

describe "display individual job details" do 

	it "show job details" do 
		job = Job.create(job_attributes)

		# visit "http://example.com/jobs/#{job.id}"
		visit job_url(job)

		expect(page).to have_text(job.company)
		expect(page).to have_text(job.title)
		expect(page).to have_text(job.description)
		expect(page).to have_text(job.skill)
		expect(page).to have_text(job.location)
	end
end