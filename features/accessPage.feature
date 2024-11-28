Feature: As a internet user
    I want to use the page GMO online
    so I test that it works correctly

@maximize
Scenario: Access to the GMO OnLine page
    Given I am on the Google homepage
    When I copy the link for GMO OnLine page to the address bar
    Then I see the welcome page 

@maximize
Scenario: Access to the OnLine Catalog page
    Given I am on the Google homepage
    When I copy the link for GMO OnLine page to the address bar
    And Press the button "Enter GMO OnLine" 
    Then I see the Online Catalog

@maximize
Scenario: Access to About This Site page
    Given I am on the Google homepage
    When I copy the link for GMO OnLine page to the address bar
    And Press the button "About The GMO Site" 
    Then I see the About This Site