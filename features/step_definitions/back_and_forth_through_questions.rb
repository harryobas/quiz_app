Given('The data store is populated with questions') do
    FactoryBot.create(:question,
    prompt: 'What is your first name?',
    ans_options: %w(peter paul foo boo jero))

    FactoryBot.create(:question,
    prompt: 'What is your favorite pet?',
    ans_options: %w(dog cat monkey snake frog))
    
  end

Given('I am on a question page') do
    visit question_path
  end
  
 
  When('I select an answer the question') do
    page.set_rack_session(answers: [])
    choose(option: 'peter') 
    click_button 'Next'
  end
  
  Then('I should see the next question') do
    expect(page).to have_content('monkey')
  end
  