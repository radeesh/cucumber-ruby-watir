Feature: Gmail Login

Scenario: Invalid login to gmail
  Given I am in Gmail
  When I enter invalid username
  And I enter invalid password
  Then I should see error message