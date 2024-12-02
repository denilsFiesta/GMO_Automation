Given(/^I am on the GMO online homepage$/) do
    page.driver.browser.manage.window.maximize
    visit('https://demo.borland.com/gmopost/')
  end
  
  When(/^I select the "About the GMO Site" option$/) do
    click_button('bAbout')
  end
  
  Then('I should see the following technologies listed:') do |table|
    expected_technologies = table.raw.flatten
    actual_technologies = page.all(:xpath, '//blockquote/ul/li').map(&:text)
    expect(actual_technologies).to match_array(expected_technologies)
  end
  

  