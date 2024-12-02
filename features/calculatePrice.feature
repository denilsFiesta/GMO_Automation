Feature: As an online shopper 
  I want the system to calculate totals, taxes and shipping costs
  so I can see the final ammout I need to pay

Background:
    Given I am on the GMO Post homepage
    When I click the "Enter GMO Online" button

Scenario Outline: Fill the quantity of just one product
  And I write "<input>" in the input box of the product "<product>"
  When I click on the "Place an order" Button
  Then I see the total price for each product

  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 1     | 
    | External Frame Backpack| 1     |  
    | Glacier Sun Glasses    | 1     | 
    | Padded Socks           | 1     | 
    | Hiking Boots           | 1     |  
    | Back Country Shorts    | 1     |

Scenario Outline: Fill the quantity of just one product with different ammouts
  And I write "<input>" in the input box of the product "<product>"
  When I click on the "Place an order" Button
  Then I see the total price for each product

  Examples:
    | product                | input |   
    | 3 Person Dome Tent     | 10     | 
    | External Frame Backpack| 2     |  
    | Glacier Sun Glasses    | 2     | 
    | Padded Socks           | 1     | 
    | Hiking Boots           | 1     |  
    | Back Country Shorts    | 18     |

Scenario: Fill the quantity of two different products
	And I write the quantities for the product with the table below 

    | product                | input |   
    | 3 Person Dome Tent     | 12     | 
    | External Frame Backpack| 12     |  

    When I click on the "Place an order" Button
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly

Scenario: Fill the quantity of three different products
	And I write the quantities for the product with the table below 

    | product                | input |   
    | 3 Person Dome Tent     | 1    | 
    | External Frame Backpack| 7     |  
    | Glacier Sun Glasses    | 21     | 

    When I click on the "Place an order" Button
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly

Scenario: Fill the quantity of four different products
	And I write the quantities for the product with the table below 

    | product                | input |   
    | 3 Person Dome Tent     | 5    | 
    | External Frame Backpack| 1     |  
    | Glacier Sun Glasses    | 2     | 
    | Padded Socks           | 1    | 

    When I click on the "Place an order" Button
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly
    
Scenario: Fill the quantity of five different products
	And I write the quantities for the product with the table below 

    | product                | input |   
    | 3 Person Dome Tent     | 12    | 
    | External Frame Backpack| 5    |  
    | Glacier Sun Glasses    | 5     | 
    | Padded Socks           | 9    | 
    | Hiking Boots           | 2     |  

    When I click on the "Place an order" Button
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly

Scenario: Fill the quantity of six different products
	And I write the quantities for the product with the table below 

    | product                | input |   
    | 3 Person Dome Tent     | 8    | 
    | External Frame Backpack| 4     |  
    | Glacier Sun Glasses    | 1     | 
    | Padded Socks           | 9    | 
    | Hiking Boots           | 2    |  
    | Back Country Shorts    | 8    |

    When I click on the "Place an order" Button
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly

Scenario: Fill the quantity of multiple different products
	And I write the quantities for the product with the table below 

    | product                | input |   
    | 3 Person Dome Tent     | 3    | 
    | Glacier Sun Glasses    | 2     | 
    | Hiking Boots           | 1    |  
    | Back Country Shorts    | 4     |

    When I click on the "Place an order" Button
    Then I see the Product Total for all the products
    And I see the correct Sales Tax for the order
    And I see the Grand Total calculated correctly