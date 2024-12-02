Feature:  
As a thoughtful site visitor, I want to verify the links behind the images on the Browser Test page  
to ensure the site operates as expected and handles errors gracefully.  

Scenario: Validate the functionality of GMO image 
    Given I am on the GMO Browser Test page
    When I click on the "Green Mountain Output" image
    Then I should be redirected to the error page with the URL "https://demo.borland.com/gmopost/browser-test.htm"

Scenario: Validate the link for "java-animate2.gif" image
    Given I am on the GMO Browser Test page
    When I click on the "Java Applet" image
    Then I should be redirected to the Java Applet page with the URL "https://demo.borland.com/gmopost/javaapplet.htm"

