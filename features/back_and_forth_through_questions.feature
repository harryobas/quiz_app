Feature: Back and forth through questions

    In order to make changes to my answers before final submission
    As a quiz taker
    I should be able to go back and forth through the different questions while taking a quiz

Background: 
    Given The data store is populated with questions 
    
Scenario: Go to next question 
    Given I am on a question page 
    When I select an answer the question  
    Then I should see the next question

