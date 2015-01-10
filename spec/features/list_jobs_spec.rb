require "rails_helper"

describe "listing all posted jobs" do
	it "lists the job" do
		job1 = Job.create(company: "SpiceWorks", title: "Ruby on Rails",
			               description: "You'll be part of a team that builds 
			               tools that power our games. We're looking for Tools 
			               Developers who are capable and excited about finding 
			               creative, efficient and effective solutions to deploy 
			               and manage technologies for our global market.",
			               skill: "Htlm, css, Ruby, Rails",
			               location: "Austin",
			               state: "Texas",
			               country: "USA",
			               experience: "Mid-level",
			               employment_type: "Full Time",
			               job_link: "https://www.app-cubator.com/jobs/12-software-engineer-tools-developer")
		job2 = Job.create(company: "FullScreen", title: "Data Engineer",
			               description: "Fullscreen's Engineering team is 
			               seeking an outstanding Software/Data/BI Engineer 
			               to create scalable, maintainable, and reliable 
			               business intelligence infrastructure.",
			               skill: "Htlm, css, Javascript, MongoDB",
			               location: "Houston",
			               state: "NYC",
			               country: "USA",
			               experience: "Mid-level",
			               employment_type: "Full Time",
			               job_link: "https://www.app-cubator.com/jobs/12-software-engineer-tools-developer")
		job3 = Job.create(company: "Home Depot", title: "Sr. IT Developer",
			               description: "As an IT professional you have expert 
			               knowledge in one or more programming languages or 
			               databases. Because of your excellent understanding 
			               of the entire project life cycle.",
			               skill: "Htlm, Python, Java, Perl, .Net",
			               location: "New York",
			               state: "NYC",
			               country: "USA",
			               experience: "Mid-level",
			               employment_type: "Full Time",
			               job_link: "https://www.app-cubator.com/jobs/12-software-engineer-tools-developer")
		visit jobs_url

		expect(page).to have_text('3 Jobs')
		expect(page).to have_text(job1.title)
		expect(page).to have_text(job2.title)
		expect(page).to have_text(job3.title)
		expect(page).to have_text(job1.company)
		expect(page).to have_text(job1.description[0..5])
		expect(page).to have_text(job1.skill)
		expect(page).to have_text(job1.location)

	end
end