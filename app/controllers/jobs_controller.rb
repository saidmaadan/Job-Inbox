class JobsController < ApplicationController

	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		redirect_to @job
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.save
		redirect_to @job
	end

	private
	def job_params
		params.require(:job).permit(:title,:company,:description,
							:skill,:location,:industry,:company_size,:website,:key_responsibility,
							:state,:zip_code,:country,:salary,:salary_rate,:employment_type,:experience,
							:relocation,:travel,:other_pay,:job_link,:company_description
		 )
	end
end
