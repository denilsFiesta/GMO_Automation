Feature: As an online shopper 
  I want the system to calculate totals, taxes and shipping costs
  so I can see the final ammout I need to pay

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button

Scenario Outline: Fill the quantity of just one product
  When I write "<quantity>" in the input box of the product "<product>"
  And I click the "Place An Order" button
  Then I see the total price for each product

  Examples:
    | product                | quantity |   
    | 3 Person Dome Tent     | 1        | 
    | External Frame Backpack| 1        |  
    | Glacier Sun Glasses    | 1        | 
    | Padded Socks           | 1        | 
    | Hiking Boots           | 1        |  
    | Back Country Shorts    | 1        |

Scenario Outline: Fill the quantity of just one product with different ammouts
  When I write "<quantity>" in the input box of the product "<product>"
  And I click the "Place An Order" button
  Then I see the total price for each product

  Examples:
    | product                | quantity |   
    | 3 Person Dome Tent     | 10       | 
    | External Frame Backpack| 7        |  
    | Glacier Sun Glasses    | 8        | 
    | Padded Socks           | 10       | 
    | Hiking Boots           | 13       |  
    | Back Country Shorts    | 18       |

Scenario: Fill the quantity of two different products
	When I write the quantities for the product with the table below 

    | product                | quantity |   
    | 3 Person Dome Tent     | 12       | 
    | External Frame Backpack| 12       |  

  And I click the "Place An Order" button
  Then I see the Product Total for all the products
  And I see the correct Sales Tax for the order
  And I see the Grand Total calculated correctly

Scenario: Fill the quantity of three different products
	When I write the quantities for the product with the table below 

    | product                | quantity |   
    | 3 Person Dome Tent     | 1        | 
    | External Frame Backpack| 7        |  
    | Glacier Sun Glasses    | 21       | 

  And I click the "Place An Order" button
  Then I see the Product Total for all the products
  And I see the correct Sales Tax for the order
  And I see the Grand Total calculated correctly

Scenario: Fill the quantity of four different products
	When I write the quantities for the product with the table below 

    | product                | quantity |   
    | 3 Person Dome Tent     | 5        | 
    | External Frame Backpack| 1        |  
    | Glacier Sun Glasses    | 2        | 
    | Padded Socks           | 1        | 

  And I click the "Place An Order" button
  Then I see the Product Total for all the products
  And I see the correct Sales Tax for the order
  And I see the Grand Total calculated correctly
    
Scenario: Fill the quantity of five different products
	When I write the quantities for the product with the table below 

    | product                | quantity |   
    | 3 Person Dome Tent     | 12       | 
    | External Frame Backpack| 5        |  
    | Glacier Sun Glasses    | 5        | 
    | Padded Socks           | 9        | 
    | Hiking Boots           | 2        |  

  And I click the "Place An Order" button
  Then I see the Product Total for all the products
  And I see the correct Sales Tax for the order
  And I see the Grand Total calculated correctly

Scenario: Fill the quantity of six different products
	When I write the quantities for the product with the table below 

    | product                | quantity |   
    | 3 Person Dome Tent     | 8        | 
    | External Frame Backpack| 4        |  
    | Glacier Sun Glasses    | 1        | 
    | Padded Socks           | 9        | 
    | Hiking Boots           | 2        |  
    | Back Country Shorts    | 8        |

  And I click the "Place An Order" button
  Then I see the Product Total for all the products
  And I see the correct Sales Tax for the order
  And I see the Grand Total calculated correctly

Scenario: Fill the quantity of multiple different products
	When I write the quantities for the product with the table below 

    | product                | quantity |   
    | 3 Person Dome Tent     | 3        | 
    | Glacier Sun Glasses    | 2        | 
    | Hiking Boots           | 1        |  
    | Back Country Shorts    | 4        |

  And I click the "Place An Order" button
  Then I see the Product Total for all the products
  And I see the correct Sales Tax for the order
  And I see the Grand Total calculated correctly