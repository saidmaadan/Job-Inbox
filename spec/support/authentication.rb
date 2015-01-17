def sign_in(candidate)
  visit new_session_url
  fill_in "Email", with: candidate.email
  fill_in "Password", with: candidate.password
  click_button "Sign In"
end

def sign_in(employer)
  visit new_session_url
  fill_in "Email", with: employer.email
  fill_in "Password", with: employer.password
  click_button "Sign In"
end