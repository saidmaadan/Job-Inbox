require 'rails_helper'

describe EmployersController do

  before do
    @employer = Employer.create!(employer_attributes)
  end

  context "when not signed in" do

    before do
      session[:employer_id] = nil
    end

    it "denied access to index" do
      get :index

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to show" do
      get :show, id: @employer

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to edit" do
      get :edit, id: @employer

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to update" do
      patch :update, id: @employer

      expect(response).to redirect_to(new_session_url)
    end

    it "denied access to destroy" do
      delete :destroy, id: @employer

      expect(response).to redirect_to(new_session_url)
    end
  end

  context "when logged in as the fake employer" do

    before do
      @fake_employer = Employer.create!(employer_attributes(email: "fake@example.com", username: "fake"))
      session[:employer_id] = @fake_employer
    end

    it "cannot edit another employer" do
      get :edit, id: @employer

      expect(response).to redirect_to(root_url)
    end

    it "cannot update another employer" do
      patch :update, id: @employer

      expect(response).to redirect_to(root_url)
    end

    it "cannot destroy another employer" do
      delete :destroy, id: @employer

      expect(response).to redirect_to(root_url)
    end

  end
end