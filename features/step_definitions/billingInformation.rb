# When I fill in the billing information form
When('I fill in the billing information form') do |table|
    billing_info = table.rows_hash

    fill_in 'billName', with: billing_info['Name']
    fill_in 'billAddress', with: billing_info['Address']
    fill_in 'billCity', with: billing_info['City']
    fill_in 'billState', with: billing_info['State']
    fill_in 'billZipCode', with: billing_info['Zip']
    fill_in 'billPhone', with: billing_info['Phone']
    fill_in 'billEmail', with: billing_info['E-mail']
    fill_in 'CardNumber', with: billing_info['Card Number']
    fill_in 'CardDate', with: billing_info['Expiration']
end

# And I select "Visa" from the "Credit Card" dropdown
And('I select {string} from the {string} dropdown') do |option, dropdown_label|
    dropdown_xpath = "/html/body/form/table/tbody/tr[2]/td[1]/table/tbody/tr[10]/td[2]/select"
    find(:xpath, dropdown_xpath).find(:option, option).select_option
end

# And I check the "Same as Bill To" checkbox
And('I check the {string} checkbox') do |checkbox_label|
    checkbox_xpath = "/html/body/form/table/tbody/tr[2]/td[3]/table/tbody/tr[1]/td[2]/input"
    find(:xpath, checkbox_xpath).set(true)
end

# Then I should see the title "OnLine Store Receipt"
Then('I should see the title {string}') do |expected_title|
    expect(page).to have_xpath("/html/body/h1")
end

# Then I should see the following "Bill To" information
Then(/^I should see the following "Bill To" information$/) do |table|
    selectors = {
        'Name' => 'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(1) > td:nth-child(2) > strong',          
        'Address' => 'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(2) > strong',    
        'FullAdress' => 'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(2) > strong' 
    }
  
    table.hashes.each do |row|
        field = row['Field']
        expected_value = row['Value']
        selector = selectors[field]
        element = find(selector)
        current_value = element.text.strip
        expect(current_value).to eq(expected_value), "Se esperaba '#{expected_value}' para el campo '#{field}', pero se encontró '#{current_value}'."
    end
end

# Then I should see the following "Ship To" information
Then(/^I should see the following "Ship To" information$/) do |table|
    selectors = {
        'Name' => 'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(1) > td:nth-child(5) > strong',          
        'Address' => 'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(5) > strong',    
        'FullAdress' => 'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(5) > strong',    
        'Phone' => 'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(4) > td:nth-child(5) > strong' 
    }
  
    table.hashes.each do |row|
        field = row['Field']
        expected_value = row['Value']
        selector = selectors[field]
        element = find(selector)
        current_value = element.text.strip
        expect(current_value).to eq(expected_value), "Se esperaba '#{expected_value}' para el campo '#{field}', pero se encontró '#{current_value}'."
    end
end

# And I fill in the shipping information form
And('I fill in the shipping information form') do |table|
    billing_info = table.rows_hash

    fill_in 'shipName', with: billing_info['Name']
    fill_in 'shipAddress', with: billing_info['Address']
    fill_in 'shipCity', with: billing_info['City']
    fill_in 'shipState', with: billing_info['State']
    fill_in 'shipZipCode', with: billing_info['Zip']
    fill_in 'shipPhone', with: billing_info['Phone']
end