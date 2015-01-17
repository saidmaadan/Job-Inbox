class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_signin
  	unless current_candidate || current_employer
  		session[:intended_url] = request.url
  		redirect_to new_session_url, alert: "You need to sign in to have access"
  	end
  end

  def current_candidate
		@current_candidate = Candidate.find(session[:candidate_id]) if session[:candidate_id]
	end

	def current_employer
		@current_employer = Employer.find(session[:employer_id]) if session[:employer_id]
	end

	helper_method :current_candidate, :current_employer

	def current_candidate?(candidate)
		current_candidate == candidate
	end

	def current_employer?(employer)
		current_employer == employer
	end

	helper_method :current_candidate?, :current_employer?

end
