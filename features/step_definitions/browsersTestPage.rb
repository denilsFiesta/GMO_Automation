Given(/^I am on the GMO Browser Test page$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/browser-test.htm')
  end
  
  When(/^I click on the "Green Mountain Output" image$/) do
    find(:xpath, '//input[@type="image" and @name="I3"]').click
  end
  
  Then(/^I should be redirected to the error page with the URL "(.*)"$/) do |expected_url|
    actual_url = page.current_url
    expect(actual_url).to eq(expected_url) 
  end
  