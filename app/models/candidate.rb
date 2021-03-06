class Candidate < ActiveRecord::Base
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
  	candidate = Candidate.find_by(email:email_or_username) || Candidate.find_by(username: email_or_username)
  	candidate && candidate.authenticate(password)
  end
      
end
