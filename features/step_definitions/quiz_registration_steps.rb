Given ('Data store is populated with questions') do
    @ques_one = FactoryBot.create(:question,
    prompt: 'What is your first name?',
    ans_options: %w(peter paul foo boo jero))

    @ques_two = FactoryBot.create(:question,
    prompt: 'What is your favorite pet?',
    ans_options: %w(dog cat monkey snake frog))
    
  end

Given('I visit the homepage') do
    visit root_path
  end
    
  When('I fill in the registration form') do
    fill_in 'quiz_taker', :with => 'Henry Watson'
    click_button 'Continue'
  end

  Then('I should see a quiz question') do
    #expect(current_path).to eql(question_path(@ques_one.id))
    expect(page).to have_content('Question')
 
  end

  Given('I submit an empty registration form') do
   click_button 'Continue'
  end
  
  Then('I should see alert message') do
    message = "you must enter your name to continue"
    expect(page).to have_content(message)
  end
  
  
  