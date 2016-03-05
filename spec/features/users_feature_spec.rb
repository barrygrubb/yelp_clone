require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign Out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign Up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign Out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end
  end

  feature "Users can only add one review per restaurant" do
   context "whilst logged in" do
     it "cannot add more than one review for a single restaurant" do
       sign_up_and_in('user1@test.com')
       create_restaurant('Pizza Planet')
       create_review('Pizza Planet', 'Mmm...delicious pizza!', '5')
       expect(page).not_to have_link('Review Pizza Planet')
     end
   end
  end


  feature "Users can only delete their own reviews" do
   context "whilst logged in" do
     it "can only delete their own review" do
       sign_up_and_in('user1@test.com')
       create_restaurant('Pizza Planet')
       create_review('Pizza Planet', 'Mmm...delicious pizza!', '5')
       click_link('Delete Pizza Planet Review')
       expect(page).not_to have_content('Mmm...delicious pizza!')
     end
     it "can't delete other user's reviews" do
       sign_up_and_in('user1@test.com')
       create_restaurant('Pizza Planet')
       create_review('Pizza Planet', 'Mmm...delicious pizza!', '5')
       click_link('Sign out')
       sign_up_and_in('user2@test.com')
       expect(page).not_to have_link('Delete Pizza Planet Review')
     end

   end
  end

end
