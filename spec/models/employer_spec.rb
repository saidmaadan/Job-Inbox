require "rails_helper"

describe 'Employer' do

	it "has a name" do
		employer = Employer.new(name: "")

		employer.valid?

		expect(employer.errors[:name].any?).to eq(true)
	end

	it "has an email" do
		employer = Employer.new(email: "")

		employer.valid?

		expect(employer.errors[:email].any?).to eq true
	end

	it "has formatted email address" do 
		emails = %w[employer@example.com firstname@example.com]
		emails.each do |email|
			employer = Employer.new(email: email)
			employer.valid?
			expect(employer.errors[:email].any?).to eq false
		end
	end

	it "should not accept not formatted email address" do
		emails = %w[@ employer@ @example.com ]
		emails.each do |email|
			employer = Employer.new(email: email)
			employer.valid?
			expect(employer.errors[:email].any?).to eq true
		end
	end

	it "has a unique case insensitive email address" do 
		employer1 = Employer.create!(employer_attributes)

		employer2 = Employer.new(email: employer1.email.upcase)
		employer2.valid?
		expect(employer2.errors[:email].first).to eq "has already been taken"
	end

	it "valid with example attributes" do
		employer = Employer.new(employer_attributes)

		expect(employer.valid?).to eq true
	end

	it "has a password" do
		employer = Employer.new(password: "")

		employer.valid?

		expect(employer.errors[:password].any?).to eq true
	end

	it "has password as well as password confirmation" do
		employer = Employer.new(password: "password", password_confirmation: "")

		employer.valid?

		expect(employer.errors[:password_confirmation].any?).to eq true
	end

	it "has matching password as well as password confirmation" do
		employer = Employer.new(password: "password", password_confirmation: "password2")

		employer.valid?

		expect(employer.errors[:password_confirmation].first).to eq "doesn't match Password"
	end


	it "has matched password and password confirmation" do 
		employer = Employer.create!(employer_attributes(password: "password", password_confirmation: "password"))

		expect(employer.valid?).to eq true
	end

	it "should not require a password when updating" do
		employer = Employer.create!(employer_attributes)

		employer.password = ""

		expect(employer.valid?).to eq true
	end

	it "encrypts the password into the password_digest attribute" do
		employer = Employer.new(password: "password")

		expect(employer.password_digest.present?).to eq true
	end
end