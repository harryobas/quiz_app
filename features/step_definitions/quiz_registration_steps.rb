Given('I visit the homepage') do
    visit root_path
  end
  
  When('I fill in the registration form') do
    fill_in 'quizee', :with => 'Henry Watson'
    click_button 'Continue'
  end
  
  Then('I should see a quiz question') do
    expect(page).to have_content('Question 1')
 
  end
  