require "rails_helper"

describe "listing all posted jobs" do
	it "lists the job" do
		visit jobs_url

		expect(page).to have_text('3 Jobs')
		expect(page).to have_text('1 Job')
		expect(page).to have_text('2 Job')
		expect(page).to have_text('3 Job')
	end
end