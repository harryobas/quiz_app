Feature: Quiz Registration

    In order to take a quiz 
    As a user 
    I should be able to register 


Scenario: register for a quiz 
    Given I visit the homepage
    When I fill in the registration form
    Then I should see a quiz question
