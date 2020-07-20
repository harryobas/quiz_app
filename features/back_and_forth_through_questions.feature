Feature: Back and forth through questions

    In order to make changes to my answers before final submission
    As a quiz taker
    I should be able to go back and forth through the different questions while taking a quiz

Background: 
    Given The data store is populated with questions
    
Scenario: Go to next question with answer selected 
    Given I am on the first question page 
    When I answer the question
    Then I should see the second question

Scenario: Go to next question with answer not selected
    Given I am on the first question
    And I do not answer the question
    Then I should get an alert message

Scenario: Go to previous question 
    Given I am on the second question 
    And I click on the previous button
    Then I should see the first question  