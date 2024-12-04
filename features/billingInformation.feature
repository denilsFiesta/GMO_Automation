Feature: As an online shopper
  I want to enter billing and shipping information
  so I can complete my purchase

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button
  And I write "1" in the input box of the product "3 Person Dome Tent"
  And I click the "Place An Order" button
  And I click the "Proceed With Order" button


  Scenario Outline: Complete billing information by reusing the data for the shipment
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "<payment_method>" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | <card_number>      |
    | Expiration        | 05/26              |
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

  Examples:
  | payment_method   | card_number          |
  | American Express | 1234-123456-12345    |
  | MasterCard       | 1234-1234-1234-1234  |
  | Visa             | 1234-1234-1234-1234  |


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
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
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


Scenario: Complete billing information by omitting the name bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "Name" bill field with "Pepe"
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


Scenario: Complete billing information by omitting the address bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "Address" bill field with "casa redo"
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


Scenario: Complete billing information by omitting the city bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "City" bill field with "cocha"
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

Scenario: Complete billing information by omitting the state bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "State" bill field with "cercado"
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

Scenario: Complete billing information by omitting the zip bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid zip code in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Zip" bill field with "33126"
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

Scenario: Complete billing information by omitting the phone bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid phone number in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Phone" bill field with "123-123-1234"
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

Scenario: Complete billing information by omitting the email bill field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid email in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "E-mail" bill field with "redito@gmail.com "
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

Scenario Outline: Complete billing information by omitting the card number payment field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "<payment_method>" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid card number of the form '<card_number>' in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Card Number" payment field with "<card_number>"
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

  Examples:
  | payment_method   | card_number          |
  | American Express | 1234-123456-12345    |
  | MasterCard       | 1234-1234-1234-1234  |
  | Visa             | 1234-1234-1234-1234  |

Scenario: Complete billing information by omitting the expiration payment field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid date of the form 'MM/YY' in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Expiration" payment field with "05/26"
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

Scenario: Complete billing information by omitting the name ship field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Address           | casa boris         |
    | City              | llallagua          |
    | State             | bustillo           |
    | Zip               | 27891              |
    | Phone             | 321-321-4321       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "Name" ship field with "Denis"
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

Scenario: Complete billing information by omitting the address ship field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Denis              |
    | City              | llallagua          |
    | State             | bustillo           |
    | Zip               | 27891              |
    | Phone             | 321-321-4321       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "Address" ship field with "casa boris"
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


Scenario: Complete billing information by omitting the city ship field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Denis              |
    | Address           | casa boris         |
    | State             | bustillo           |
    | Zip               | 27891              |
    | Phone             | 321-321-4321       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "City" ship field with "llallagua"
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

Scenario: Complete billing information by omitting the state ship field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Denis              |
    | Address           | casa boris         |
    | City              | llallagua          |
    | Zip               | 27891              |
    | Phone             | 321-321-4321       |
  And I click the "Place The Order" button
  And I see pop-up with the message "This is a required field."
  And I click the "OK" button on the pop-up
  And I fill in the "State" ship field with "bustillo"
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

Scenario: Complete billing information by omitting the zip ship field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Denis              |
    | Address           | casa boris         |
    | City              | llallagua          |
    | State             | bustillo           |
    | Phone             | 321-321-4321       |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid zip code in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Zip" ship field with "27891"
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

Scenario: Complete billing information by omitting the phone ship field
  When I fill in the billing information form
    | Field             | Value              |
    | Name              | Pepe               |
    | Address           | casa redo          |
    | City              | cocha              |
    | State             | cercado            |
    | Zip               | 33126              |
    | Phone             | 123-123-1234       |
    | E-mail            | redito@gmail.com   |
  And I select "Visa" from the "Credit Card" dropdown
  And I fill in the payment information form
    | Card Number       | 1234-1234-1234-1234|
    | Expiration        | 05/26              |
  And I fill in the shipping information form
    | Field             | Value              |
    | Name              | Denis              |
    | Address           | casa boris         |
    | City              | llallagua          |
    | State             | bustillo           |
    | Zip               | 27891              |
  And I click the "Place The Order" button
  And I see pop-up with the message "Please enter a valid phone number in this field."
  And I click the "OK" button on the pop-up
  And I fill in the "Phone" ship field with "321-321-4321"
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

