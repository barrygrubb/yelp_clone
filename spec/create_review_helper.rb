def create_review(name, review, rating)
  click_link "Review #{name}"
    fill_in "Thoughts", with: review
    select rating, from: 'Rating'
    click_button 'Leave Review'
end
