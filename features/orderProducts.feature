Feature: As an online shopper 
  I want the system to calculate totals, taxes and shipping costs
  so I can see the final ammout I need to pay

Background:
  Given I am on the GMO OnLine main page
  And I click the "Enter GMO OnLine" button


Scenario Outline: Fill the quantity of many different products for buying
	When I type the "<quantities>" for the following "<products>" for buying
  And I click the "Place An Order" button
  Then I should see the "Place Order" page
  And I should see the following "<products>" in the Product Description column
  And I should see the "<quantities>" for the "<products>" in the Qty column
  And I should see the "<unit_prices>" for the "<products>" in the Unit Price column
  And I should see the "<total_prices>" for the "<products>" in the Total Price column
  And I should see the "<product_total>" in the Product Total row
  And I should see the "<sales_tax>" in the Sales Tax row
  And I should see the "<grand_total>" in the Grand Total row

  Examples:
  | products                                  | quantities      | unit_prices | total_prices | product_total | sales_tax| grand_total |
  | 3 Person Dome Tent; Hiking Boots          | 10; 13         |  $ 299.99; $ 109.90       | $ 2999.90; $ 1428.70        | $ 4428.60| $ 221.43| $ 4655.03|

