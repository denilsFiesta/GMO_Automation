Feature:  
As an online shopper I want to know how the page was made.

Scenario: Look the technologies used in the site  
    Given I am on the GMO online site  
    When click the "About the GMO Site" button  
    Then I should see the following technologies listed:  

        | HTML 3.2 |
        | HTML Browser Extensions |
        | Animation |
        | JavaScript |
        | CGI |
        | Java |
        | ActiveX |
        | Client-side processes |
        | Server-side processes |