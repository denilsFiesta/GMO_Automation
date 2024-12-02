# require 'selenium-webdriver'

# And(/^I fill in the input box of the product "(.*)" with "(.*)"$/) do |product, input|
#   within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
#     row = find('tr', text: product)
#     row.find('input[type="text"]').set(input)
#   end
# end

# When(/^I click on the "Place an order" Button$/) do
#   click_button('bSubmit')
# end

# Then(/^I receive a notification "(.*)"$/) do |notification|
#   page.driver.browser.switch_to.alert.text == notification
#   page.driver.browser.switch_to.alert.accept
# end

require 'selenium-webdriver'

And(/^I type "(.*)" in the quantity box for "(.*)"$/) do |input, product|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    row = find('tr', text: product)
    row.find('input[type="text"]').set(input)
  end
end

When(/^I press the "Submit Order" button$/) do
  click_button('bSubmit')
end

Then(/^I see a message "(.*)"$/) do |notification|
  page.driver.browser.switch_to.alert.text == notification
  page.driver.browser.switch_to.alert.accept
end
