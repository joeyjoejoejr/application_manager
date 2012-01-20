Feature: Application
  In order to complete the application process
  As an applicant
  I want to be able to create and edit an application
 
  Scenario: Button to create an application
    Given that I am signed in
    And I don't have an application
    When I go to the User's profile page
    Then I should see "Create an Application"

  Scenario: Fill out an application
    Given that I am signed in
    And I don't have an application
    When I go to the User's profile page
    And Fill out the application form
    Then I should have an application
    
