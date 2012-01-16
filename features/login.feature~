Feature: Login Manageer
	In order to create and manage applictions
	As a user
	I want a fully functioning login system

#Scenario Outline: Show user profile or ask to log in
#	Given the following user records
#	| email | password | admin |
#	| bob@example.com | secret | false |
#	| admin@example.com | secret | true |
#	Given I am logged in as "<login>" with password "secret"
#	When I visit the root path
#	Then I should <action>
#
#	Examples:
#	| login | action |
#	| admin@example.com | not see "Sign up" |
#	| bob@example.com | not see "Sign up" |
#	| | see "Sign up" |

Scenario: Create a new user
	Given I am on the new User page
	When I fill out the new user form with valid information
	Then I should be on User's profile page

Scenario: Fail to create a new user
	Given I am on the new User page
	When I fill out the new user form with invalid information
	Then I should see see "Sign up"

