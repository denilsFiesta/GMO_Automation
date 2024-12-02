Feature: As a distracted shopper  
  I want to see an error pop-up when I input incorrect quantities  
  So I can proceed with my purchase  

Background:  
    Given I am browsing the online catalog  
    When I click on the "Enter GMO Online" button  

@maximize  
Scenario Outline: Input letters in the quantity field  
  And I type "<input>" in the quantity box for "<product>"  
  When I press the "Place an order" button  
  Then I see a message "Please enter only digits in this field."  

 Examples:
    | product                | input | 
    | 3 Person Dome Tent     | uno   |
    | External Frame Backpack| seis  |
    | Glacier Sun Glasses    | cinco |
    | Padded Socks           | dos   |
    | Hiking Boots           | diez  |
    | Back Country Shorts    | quince|

Scenario Outline: Leave the quantity field blank  
  And I type "<input>" in the quantity box for "<product>"  
  When I press the "Submit Order" button  
  Then I see a message "Please add an item to your cart first."  

  Examples:  
    | product                | input |  
    | Camping Tent           |       |  
    | Hiking Backpack        |       |  
    | Sunglasses             |       |  
    | Thermal Socks          |       |  
    | Trekking Shoes         |       |  
    | Outdoor Shorts         |       |

Scenario Outline: Input invalid symbols in the quantity field  
  And I type "<input>" in the quantity box for "<product>"  
  When I press the "Place an order" button  
  Then I see a message "Please enter only digits in this field."  

  Examples:
    | product                | input | 
    | 3 Person Dome Tent     | #$%   |
    | External Frame Backpack| HJ%ZX |
    | Glacier Sun Glasses    | []+? |
    | Padded Socks           | !@#   |
    | Hiking Boots           | %^&*~ |
    | Back Country Shorts    | ' 'o  |


Scenario Outline: Input negative numbers in the quantity field  
  And I type "<input>" in the quantity box for "<product>"  
  When I press the "Place an order" button  
  Then I see a message "Please enter only digits in this field."  

  Examples:  
    | product                | input |  
    | Camping Tent           | -4    |  
    | Hiking Backpack        | -11   |  
    | Sunglasses             | -390  |  
    | Thermal Socks          | -987  |  
    | Trekking Shoes         | -109  |  
    | Outdoor Shorts         | -761  |  

Scenario Outline: Input decimal numbers in the quantity field  
  And I type "<input>" in the quantity box for "<product>"  
  When I press the "Place an order" button  
  Then I see a message "Please enter only digits in this field."  

  Examples:  
    | product                | input |  
    | Camping Tent           | 0.1   |  
    | Hiking Backpack        | 3.5   |  
    | Sunglasses             | 55.03 |  
    | Thermal Socks          | 12.99 |  
    | Trekking Shoes         | 88,07 |  
    | Outdoor Shorts         | 0.003 |  