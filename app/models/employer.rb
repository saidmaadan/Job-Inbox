class Employer < ActiveRecord::Base
  has_many :jobs, dependent: :destroy

	has_secure_password

	validates :password, length: { minimum: 8, allow_blank: true }

  validates :name, presence: true
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }
       

  def self.authenticate(email_or_username,password)
  	employer = Employer.find_by(email:email_or_username) || Employer.find_by(username: email_or_username)
  	employer && employer.authenticate(password)
  end

end
