Feature:  
As a thoughtful site visitor, I want to verify the links behind the images on the Browser Test page  
to ensure the site operates as expected and handles errors gracefully.  

Scenario: Validate the functionality of image links
    Given I am on the GMO Browser Test page
    When I click on the "Green Mountain Output" image
    Then I should be redirected to the error page with the URL "https://demo.borland.com/gmopost/browser-test.htm"
