module ApplicationHelper
	def current_candidate
		@current_candidate = Candidate.find(session[:candidate_id]) if session[:candidate_id]
	end

	def current_employer
		@current_employer = Employer.find(session[:employer_id]) if session[:employer_id]
	end
end
