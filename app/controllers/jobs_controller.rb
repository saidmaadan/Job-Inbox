class JobsController < ApplicationController

	def index
		@jobs = ["1 Job", "2 Job", "3Job"]
	end
end
