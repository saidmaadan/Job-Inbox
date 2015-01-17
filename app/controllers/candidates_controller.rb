class CandidatesController < ApplicationController
	before_action :require_signin, expect: [:new, :create]
	before_action :require_correct_candidate, only: [:edit, :update, :destroy]

	def index
		@candidates = Candidate.all 
	end

	def show
		@candidate = Candidate.find(params[:id])
	end

	def new
		@candidate = Candidate.new
	end

	def create
		@candidate = Candidate.new(candidate_params)
		if @candidate.save
			session[:candidate_id] = @candidate.id
			redirect_to @candidate, notice: "Thanks for signing up as candidate"
		else
			render :new
		end
	end

	def edit
		@candidate = Candidate.find(params[:id])
	end

	def update
		@candidate = Candidate.find(params[:id])
		if @candidate.update(candidate_params)
			redirect_to @candidate
		else
			render :edit
		end
	end

	def destroy
		@candidate = Candidate.find(params[:id])
		@candidate.destroy
		session[:candidate_id] = nil
		redirect_to root_path, alert: "Account has been deleted, sorry to see you going!"
	end


	private

	def require_correct_candidate
		@candidate = Candidate.find(params[:id])
			redirect_to root_url unless current_candidate?(@candidate)
		end

	def candidate_params
		params.require(:candidate).permit(:name,:email,:password,:password_confirmation,:username,:about, :accomplish, :powerpoint, :specialization, :location, :sex, :phone, :school, :work, :marital, :video, :github, :twitter, :linkedin, :dribbble, :facebook, :degree, :start_year, :grad_year)
	end

end
