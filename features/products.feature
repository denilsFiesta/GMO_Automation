Feature: Testing GMO Post Product Navigation
  As an internet user
  I want to interact with the demo GMO Post website
  So I can view and explore details of available products

Scenario: View details of a single product
    Given I am on the GMO Post homepage
    When I click the "Enter GMO Online" button
    Then I should see the catalog

Scenario Outline: View details of a selected product
    Given I am on the GMO Post homepage
    When I click the "Enter GMO Online" button
    And I click the "<product_name>" product
    Then I should see the following details: "<product_details>"

    Examples:
      | product_name             | product_details                                                                                                         |
      | 3 Person Dome Tent       | Our best 3 person backpack dome tent                                                                                   |
      | External Frame Backpack  | Our most popular external frame backpack                                                                                   |

