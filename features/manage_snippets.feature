Feature: Manage Snippets
  
  Scenario: Snippet of the Day
    Given that a snippet exists
    When I visit the main page
    Then I should see a snippet for today
  
  Scenario: Submit New Snippet
    Given I am logged in
    When I visit the main page
    And I click "Submit New"
    And I fill in "Title" with "Rails 3 Commit"
    And I fill in "Code" with "def hello(thing)"
    And I press "Submit"
    Then it should be successful
    And I should see a notice message
    
  Scenario: Viewing Snippet Queue
    Given that a snippet exists
    And I am logged in as an "admin" user
    When I visit the main page
    And I click "Snippet Queue"
    Then I should see "1" "pending" snippet
  
  Scenario: Approving Snippet
    Given that a snippet exists
    And I am logged in as an "admin" user
    And I am on the snippet queue page
    When I press "Approve"
    Then I should see a notice message
    And I should see "1" "approved" snippet

  Scenario: Snippet Selection
    Given that a snippet exists with the title "Snippet Today"
    And that snippet is approved
    And the time is "11:59pm"
    When the clock hits "12:00am"
    And I visit the main page
    Then I should see a snippet with the title "Snippet Today"
    