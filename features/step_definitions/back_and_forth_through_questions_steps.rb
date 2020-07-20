Given('The data store is populated with questions') do
    @ques_one = FactoryBot.create(:question,
    prompt: 'What is your first name?',
    ans_options: %w(peter paul foo boo jero))

    @ques_two = FactoryBot.create(:question,
    prompt: 'What is your favorite pet?',
    ans_options: %w(dog cat monkey snake frog))

    @ques_three = FactoryBot.create(:question,
    prompt: 'What country are you from?',
    ans_options: %w(uk italy us canada china))
  end

Given('I am on the first question page') do
    visit question_path(@ques_one.id)
  end

  When('I answer the question') do
    choose(option: 'peter')
    click_button 'Next'
  end
 
  Then('I should see the second question') do
    expect(page).to have_content('Monkey')
  end

  Given('I am on the first question') do
   visit question_path(@ques_one.id)
  end

  Given('I do not answer the question') do
    click_button 'Next'
  end
  
  Then('I should get an alert message') do 
    message = "you must select an answer to continue"
    expect(page).to have_content(message)
  end

  Given('I am on the second question') do
    visit question_path(@ques_two)
  end
  
  Given('I click on the previous button') do
    click_button 'Previous'
  end
  
  Then('I should see the first question') do
    expect(current_path).to eql(question_path(@ques_one.id))
    #expect(page).to have_content('Peter')
  end
  
  

  

  