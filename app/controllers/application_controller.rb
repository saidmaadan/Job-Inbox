class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # def correct_employer_job
  # 	@current_employer = Employer.find(session[:employer_id])
  # 	correct_employer = @current_employer.jobs
  # 	redirect_to root_url unless correct_employer?(@current_employer)
  # end

  # helper_method :correct_employer_job

  # def correct_employer?(employer)
  # 	@correct_employer == current_employer
  # end
  # helper_method :correct_employer?

  def require_signin
  	unless current_candidate || current_employer
  		session[:intended_url] = request.url
  		redirect_to new_session_url, alert: "You need to sign in to have access"
  	end
  end

  def current_candidate
		@current_candidate ||= Candidate.find(session[:candidate_id]) if session[:candidate_id]
	end

	def current_employer
		@current_employer ||= Employer.find(session[:employer_id]) if session[:employer_id]
	end

	helper_method :current_candidate, :current_employer

	def current_candidate?(candidate)
		current_candidate == candidate
	end

	def current_employer?(employer)
		current_employer == employer
	end

	helper_method :current_candidate?, :current_employer?

	def require_admin
	  unless current_candidate_admin? || current_employer_admin?
	    redirect_to root_url, alert: "Unauthorized access!"
	  end
	end

	def current_employer_admin?
	  current_employer && current_employer.admin?
	end

	def current_candidate_admin?
	  current_candidate && current_candidate.admin?
	end

	helper_method :current_employer_admin?, :current_candidate_admin?
end
