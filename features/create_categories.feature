Feature: Create Categories
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: Successfully create categories
    Given I am on the new categories page
    When I fill in "category_name" with "Foobar"
    And I fill in "category_keywords" with "key"
    And I fill in "category_permalink" with "link"
    And I fill in "category_description" with "description"
    And I press "Save"
    Then I should see "Category was successfully saved."
    Then I should see "Foobar"
    Then I should see "key"
    Then I should see "link"
    Then I should see "description"
    
  Scenario: Successfully edit categories
    Given I am on the new categories page
    Then I should see "General"
    Then I follow "General"
    And I fill in "category_keywords" with "key"
    And I fill in "category_description" with "description"
    And I press "Save"
    Then I should see "Category was successfully saved."
    Then I should see "General"
    Then I should see "key"
    Then I should see "description"