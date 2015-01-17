require 'rails_helper'

describe CandidatesController do

  before do
    @candidate = Candidate.create!(candidate_attributes)
  end

  context "when not logged in" do

    before do
      session[:candidate_id] = nil
    end

    it "denied access to index" do
      get :index

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to show" do
      get :show, id: @candidate

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to edit" do
      get :edit, id: @candidate

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to update" do
      patch :update, id: @candidate

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to destroy" do
      delete :destroy, id: @candidate

      expect(response).to redirect_to(new_session_url)
    end
  end

   context "when logged in as the fake candidate" do

    before do
      @fake_candidate = Candidate.create!(candidate_attributes(email: "fake@example.com", username: "fake"))
      session[:candidate_id] = @fake_candidate
    end

    it "cannot edit another candidate" do
      get :edit, id: @candidate

      expect(response).to redirect_to(root_url)
    end

    it "cannot update another candidate" do
      patch :update, id: @candidate

      expect(response).to redirect_to(root_url)
    end

    it "cannot destroy another candidate" do
      delete :destroy, id: @candidate

      expect(response).to redirect_to(root_url)
    end
  end

end