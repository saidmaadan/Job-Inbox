require 'rails_helper'

describe JobsController do

  before do
    @job = Job.create!(job_attributes)
  end

  context "when not signed in as an admin user" do

    before do
      non_admin = Employer.create!(employer_attributes(admin: false))
      session[:employer_id] = non_admin.id
    end

    it "cannot access destroy" do
      delete :destroy, id: @job

      expect(response).to redirect_to(root_url)
    end

    before do
      non_admin = Candidate.create!(candidate_attributes(admin: false))
      session[:candidate_id] = non_admin.id
    end
    
    it "cannot access destroy" do
      delete :destroy, id: @job

      expect(response).to redirect_to(root_url)
    end

  end

end