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
    And Fill out the new application form
    Then the user should have an application
    
  Scenario: View Application
    Given that I am signed in
    And I do have an application
    When I go to the User's profile page
    And I dump the response
    Then I should see their application
    
  Scenario: Edit Application
    Given that I am signed in
    And I do have an application
    And I am on the User's profile page
    When Fill out the edit application form
    Then I should see the updated information
    
  Scenario: Delete Application
    Given that I am signed in
    And I do have an application
    And I am on the User's profile page
    When I follow "Delete Application"
    Then I should not have an application
    
