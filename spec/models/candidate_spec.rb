require "rails_helper"

describe 'Candidate' do

	it "has a name" do
		candidate = Candidate.new(name: "")

		candidate.valid?

		expect(candidate.errors[:name].any?).to eq(true)
	end

	it "has an email" do
		candidate = Candidate.new(email: "")

		candidate.valid?

		expect(candidate.errors[:email].any?).to eq true
	end

	it "has formatted email address" do 
		emails = %w[candidate@example.com firstname@example.com]
		emails.each do |email|
			candidate = Candidate.new(email: email)
			candidate.valid?
			expect(candidate.errors[:email].any?).to eq false
		end
	end

	it "should not accept not formatted email address" do
		emails = %w[@ candidate@ @example.com ]
		emails.each do |email|
			candidate = Candidate.new(email: email)
			candidate.valid?
			expect(candidate.errors[:email].any?).to eq true
		end
	end

	it "has a unique case insensitive email address" do 
		candidate1 = Candidate.create!(candidate_attributes)

		candidate2 = Candidate.new(email: candidate1.email.upcase)
		candidate2.valid?
		expect(candidate2.errors[:email].first).to eq "has already been taken"
	end

	it "valid with example attributes" do
		candidate = Candidate.new(candidate_attributes)

		expect(candidate.valid?).to eq true
	end

	it "has a password" do
		candidate = Candidate.new(password: "")

		candidate.valid?

		expect(candidate.errors[:password].any?).to eq true
	end

	it "has password as well as password confirmation" do
		candidate = Candidate.new(password: "password", password_confirmation: "")

		candidate.valid?

		expect(candidate.errors[:password_confirmation].any?).to eq true
	end

	it "has matching password as well as password confirmation" do
		candidate = Candidate.new(password: "password", password_confirmation: "password2")

		candidate.valid?

		expect(candidate.errors[:password_confirmation].first).to eq "doesn't match Password"
	end


	it "has matched password and password confirmation" do 
		candidate = Candidate.create!(candidate_attributes(password: "password", password_confirmation: "password"))

		expect(candidate.valid?).to eq true
	end

	it "should not require a password when updating" do
		candidate = Candidate.create!(candidate_attributes)

		candidate.password = ""

		expect(candidate.valid?).to eq true
	end

	it "encrypts the password into the password_digest attribute" do
		candidate = Candidate.new(password: "password")

		expect(candidate.password_digest.present?).to eq true
	end
end