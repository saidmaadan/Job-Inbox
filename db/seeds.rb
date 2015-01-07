# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Job.create!([
	{
		 company: "SpiceWorks", 
		 title: "Ruby on Rails",
		 description: "You'll be part of a team that builds 
		 tools that power our games. We're looking for Tools 
		 Developers who are capable and excited about finding 
		 creative, efficient and effective solutions to deploy 
		 and manage technologies for our global market.",
		 skill: "Htlm, css, Ruby, Rails",
		 location: "Austin"
	},
	{
		 company: "FullScreen", title: "Data Engineer",
	   description: "Fullscreen's Engineering team is 
	   seeking an outstanding Software/Data/BI Engineer 
	   to create scalable, maintainable, and reliable 
	   business intelligence infrastructure.",
	   skill: "Htlm, css, Javascript, MongoDB",
	   location: "Houston"
	},
	{
		 company: "Home Depot", title: "Sr. IT Developer",
     description: "As an IT professional you have expert 
     knowledge in one or more programming languages or 
     databases. Because of your excellent understanding 
     of the entire project life cycle.",
     skill: "Htlm, Python, Java, Perl, .Net",
     location: "New York"
	}
	])