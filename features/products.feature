Feature: Testing GMO Post Product Navigation
  As an internet user
  I want to interact with the demo GMO Post website
  So I can view and explore details of available products

Scenario: View details of a single product
    Given I am on the Google homepage
    When I paste the GMO OnLine URL in the address bar
    And I click the "Enter GMO OnLine" button
    Then I should see the catalog

Scenario Outline: View details of a selected product
    Given I am on the Google homepage
    When I paste the GMO OnLine URL in the address bar
    And I click the "Enter GMO OnLine" button
    And I click the "<product_name>" product
    Then I should see the following details: "<product_details>"

    Examples:
      | product_name             | product_details                                                                                                 |
      | 3 Person Dome Tent       | Our best 3 person backpack dome tent                                                                            |
      | External Frame Backpack  | Our most popular external frame backpack                                                                        |
      | Glacier Sun Glasses      | Our best glacier sun glasses will protect you on your next expedition or when you hit the slopes.               |
      | Padded Socks             | Our favorite padded socks will make your next back country trek easier on your feet.                            |
      | Hiking Boots             | Climb any mountain with our PermaDry all leather hiking boots.                                                  |
      | Back Country Shorts      | Our quick drying shorts are a customer favorite. Perfect for a day of any outdoor activity or just lounging around the camp.               |


