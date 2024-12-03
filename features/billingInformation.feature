Feature: As an online shopper
  I want to enter billing and shipping information
  so I can complete my purchase

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button
  And I write "1" in the input box of the product "3 Person Dome Tent"
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button

Scenario: Complete billing information by reusing the data for the shipment
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I select "Visa" from the "Credit Card" dropdown
  And I check the "Same as Bill To" checkbox
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |
    | Phone             | 123-123-1234         |

Scenario: Complete billing information with different data for the shipment
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Denis              |
    | Address           | casa boris         |
    | City              | llallagua          |
    | State             | bustillo           |
    | Zip               | 27891              |
    | Phone             | 321-321-4321       |
  And I click the "Place The Order" button

  Then I should see the "OnLine Store Receipt" page
  
  And I should see the following "Bill To" information
    | Field             | Value                |
    | Name              | Pepe                 |
    | Address           | casa redo            |
    | FullAdress        | cocha, cercado 33126 |

  And I should see the following "Ship To" information
    | Field             | Value                     |
    | Name              | Denis                     |
    | Address           | casa boris                |
    | FullAdress        | llallagua, bustillo 27891 |
    | Phone             | 321-321-4321              |


