Feature: Users Page
	In order to see applicants
	As an administrator
	I want to have a paginated users page
	
	Scenario: Loged in as admin
		Given that I am signed in
		And I am an admin
		When I go to the user list
		Then I should see "All applicants"
		
