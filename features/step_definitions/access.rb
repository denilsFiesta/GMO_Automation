# Given I am on the Google homepage
Given(/^I am on the Google homepage$/) do
  page.driver.browser.manage.window.maximize
  visit('/')
end

# When I copy the link for GMO Online page to the address bar
When(/^I copy the link for GMO OnLine page to the address bar$/) do
  visit('https://demo.borland.com/gmopost/')
end

# Then I see the welcome page
Then(/^I see the welcome page$/) do
  # Verifica que el texto "GMO OnLine" esté presente en la página.
  expect(page).to have_xpath("/html/body/h1/font")
end

# And Press the button "Enter GMO OnLine" 
When('Press the button {string}') do |buttonName|
  click_button(buttonName) 
end
# Then I see the Online Catalog
Then(/^I see the Online Catalog$/) do
  expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
  sleep 2
end


# Then I see the About This Site
Then(/^I see the About This Site$/) do
  expect(page).to have_xpath("/html/body/table/tbody/tr/td[1]/h1")
  sleep 2
end