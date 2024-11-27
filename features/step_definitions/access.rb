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
