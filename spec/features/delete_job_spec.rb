require 'rails_helper'

describe "Delete Job Post" do
	before do
    admin = Employer.create!(employer_attributes(admin: true))

    sign_in(admin)
  end

  it "delete job post and redirect to index page" do
    job = Job.create(job_attributes)

    visit job_path(job)

    click_link 'Delete'

    expect(current_path).to eq(jobs_path)
    expect(page).not_to have_text(job.title)
    expect(page).to have_text('Job has been deleted')
  end

  before do
    admin = Candidate.create!(candidate_attributes(admin: true))

    sign_in(admin)
  end
  
  it "delete job post and redirect to index page" do
    job = Job.create(job_attributes)

    visit job_path(job)

    click_link 'Delete'

    expect(current_path).to eq(jobs_path)
    expect(page).not_to have_text(job.title)
    expect(page).to have_text('Job has been deleted')
  end
end
