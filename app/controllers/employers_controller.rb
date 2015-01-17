class EmployersController < ApplicationController
	before_action :require_signin, expect: [:new, :create]
	before_action :require_correct_employer, only: [:edit, :update, :destroy]

	def index
		@employers = Employer.all 
	end

	def show
		@employer = Employer.find(params[:id])
	end

	def new
		@employer = Employer.new
	end

	def edit
		@employer = Employer.find(params[:id])
	end

	def update
		@employer = Employer.find(params[:id])
		if @employer.update(employer_params)
			redirect_to @employer
		else
			render :edit
		end
	end

	def create
		@employer = Employer.new(employer_params)
		if @employer.save
			session[:employer_id] = @employer.index
			redirect_to @employer, notice: "Thanks for signing up as employer!"
		else
			render :new
		end
	end

	def destroy
		@employer = Employer.find(params[:id])
		@employer.destroy
		session[:employer_id] = nil
		redirect_to root_path, alert: "Account has been deleted, sorry to see you going!"
	end

	private

	def require_correct_employer
		@employer = Employer.find(params[:id])
		 #unless current_employer== @employer
			redirect_to root_url unless current_employer?(@employer)
	end

	def employer_params
		params.require(:employer).permit(:name, :email, :password, :password_confirmation, :username,:about,:state,:city,
			:zipcode,:country,:twitter,:linkedin,:facebook,:website, :company_name, :heard_us)
	end
end
