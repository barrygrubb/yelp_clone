def sign_up_and_in(email)
  visit('/')
  #click_link('Sign up')
  page.all(:link,'Sign up')[0].click
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
