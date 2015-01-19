class JobsController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	#before_action :correct_employer_job, only: [:edit, :update]
	#before_action :correct_employer, only: [:edit, :update]
	before_action :require_admin, only: [:destroy]

	def index
		@jobs = Job.recent
	end

	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		if @job.update(job_params)
			flash[:notice]='Job updated successfully'
		  redirect_to @job
		else
			render :edit
		end
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
		 redirect_to @job, notice: "Job successfully created!"
		else
			render :new
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_url, alert: "Job has been deleted"
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
