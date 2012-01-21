Feature: Friendly_Forwarding
	In order to make a more user friendly experience
	As a developer
	I want a friendly forwarding system for my app
	
	Scenario: Forwarding to requested page after sign in
		Given that I am not signed in
		When I go to the edit user page
		And I log in as the correct user
		Then I should be on the edit user page
