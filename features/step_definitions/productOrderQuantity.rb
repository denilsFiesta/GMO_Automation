require 'selenium-webdriver'

And(/^I type "(.*)" in the quantity box for "(.*)"$/) do |input, product|
    xpath = "//tr[td[contains(text(), '#{product}')]]//input[@type='text']"
    find(:xpath, xpath).set(input)
  end 
  
When(/^I press the "Place an order" button$/) do
  click_button('bSubmit')
end

Then(/^I see a message "(.*)"$/) do |notification|
  page.driver.browser.switch_to.alert.text == notification
  page.driver.browser.switch_to.alert.accept
end
