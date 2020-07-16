Given('I visit the homepage') do
    visit root_path
  end

  And ('Data store is populated with questions') do
    FactoryBot.create(:question,
    prompt: 'What is your first name?',
    ans_options: %w(peter paul foo boo jero))

    FactoryBot.create(:question,
    prompt: 'What is your favorite pet?',
    ans_options: %w(dog cat monkey snake frog))
    
  end
  
  When('I fill in the registration form') do
    fill_in 'quiz_taker', :with => 'Henry Watson'
    click_button 'Continue'
  end

  Then('I should see a quiz question') do
    expect(current_path).to eql(question_path)
    expect(page).to have_content('Question')
 
  end
  