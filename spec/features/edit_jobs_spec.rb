require "rails_helper"

describe "Edit listing" do 
	it "edit the listing job and display edited details page" do 
		job = Job.create(job_attributes)

		visit job_url(job)

		click_link "Edit"

		expect(current_path).to eq(edit_job_path(job))

		# expect(find_field('Title').value).to eq(job.title)
	end
end