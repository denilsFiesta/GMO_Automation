require 'selenium-webdriver'

And(/^I type "(.*)" in the quantity box for "(.*)"$/) do |input, product|
    xpath = "//tr[td[contains(text(), '#{product}')]]//input[@type='text']"
    find(:xpath, xpath).set(input)
  end 
 
Then(/^I see a message "(.*)"$/) do |notification|
  page.driver.browser.switch_to.alert.text == notification
  page.driver.browser.switch_to.alert.accept
end


And(/^I fill in the products form with the following data$/) do |table|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    table.hashes.each do |row|
      product = row['product']
      input = row['input']
      product_row = find('tr', text: product)
      product_row.find('input[type="text"]').set(input)
    end
  end
end


Then(/^the form looks like the following table$/) do |table|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    table.hashes.each do |row|
      product = row['product']
      expected_value = row['input']
      product_row = find('tr', text: product)
      actual_value = product_row.find('input[type="text"]').value
      
      expect(actual_value).to eq(expected_value)
    end
  end
end

