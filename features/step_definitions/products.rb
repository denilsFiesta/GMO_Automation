# Given I am on the GMO Post homepage
Given(/^I am on the GMO Post homepage$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
end

Then(/^I should see the catalog$/) do
    expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
    sleep 2
end
  # And I click the "<product_name>" product
When(/^I click the "(.*)" product$/) do |product_name|
    click_link(product_name)
end
  
  # Then I should see the details for "<product_name>"
Then(/^I should see the details for "(.*)"$/) do |product_name|
    # Verifica que el nombre del producto esté presente en la página
    expect(page).to have_content(product_name)
    sleep 2
end
  
  # Then I should see the following details: "<product_details>"
Then(/^I should see the following details: "(.*)"$/) do |product_details|
    # Verifica que la descripción del producto esté visible
    expect(page).to have_content(product_details)
    sleep 2
end
  