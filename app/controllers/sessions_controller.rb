class SessionsController < ApplicationController

	def new
	end

	def create
		if employer = Employer.authenticate(params[:email], params[:password])
			session[:employer_id] = employer.id
			flash[:notice] = "Welcome back, #{employer.name}!"
			redirect_to employer
		elsif
			candidate = Candidate.authenticate(params[:email], params[:password])
			session[:candidate_id] = candidate.id
			flash[:notice] = "Welcome back, #{candidate.name}!"
			redirect_to candidate
		else
			flash.now[:alert] = "Invalid email/password combination!"
			render :new
		end	
	end
end
