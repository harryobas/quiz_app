Feature: Quiz Registration

    In order to take a quiz 
    As a user 
    I should be able to register 
    For a quiz with my name 


Scenario: register for a quiz 
    Given I visit the homepage
    And Data store is populated with questions
    When I fill in the registration form
    Then I should see a quiz question

Scenario: register for a quiz without name 
    Given I visit the homepage
    And I submit an empty registration form 
    Then I should see alert message 
