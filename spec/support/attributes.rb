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