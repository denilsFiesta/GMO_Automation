When(/^I type the "(.*)" quantities for the following "(.*)" products for buying$/) do |quantities, products|
    products_list = products.split(';').map(&:strip)
    quantities_list = quantities.split(';').map(&:strip).map(&:to_i)
 
    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
  
        case product
            when "3 Person Dome Tent"
                fill_in 'QTY_TENTS', :with => quantity
            when "External Frame Backpack"
                fill_in 'QTY_BACKPACKS', :with => quantity
            when "Glacier Sun Glasses"
                fill_in 'QTY_GLASSES', :with => quantity
            when "Padded Socks"
                fill_in 'QTY_SOCKS', :with => quantity
            when "Hiking Boots"
                fill_in 'QTY_BOOTS', :with => quantity
            when "Back Country Shorts"
                fill_in 'QTY_SHORTS', :with => quantity
        end
    end
end
  

# And I should see the following products in the product description
And(/^I should see the following "(.*)" in the Product Description column$/) do |products|
    products_list = products.split(';').map(&:strip)
    products_list.each do |product_description|
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product_description}']"
        expect(page).to have_xpath(product_xpath)
    end
end

# And I should see the "quantities" for the "<products>" in the Qty column
And(/^I should see the "(.*)" for the "(.*)" in the Qty column$/) do |quantities, products|
    products_list = products.split(';').map(&:strip)
    quantities_list = quantities.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        quantity = quantities_list[index]
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        quantity_xpath = "#{product_xpath}/ancestor::tr[1]/td[1][normalize-space(text())='#{quantity}']"
        expect(page).to have_xpath(quantity_xpath)
    end
end

And(/^I should see the "(.*)" for the "(.*)" in the Unit Price column$/) do |unit_prices, products|
    products_list = products.split(';').map(&:strip)
    prices_list = unit_prices.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        unit_price = prices_list[index]
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        unit_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[4][normalize-space(text())='#{unit_price}']"
        expect(page).to have_xpath(unit_price_xpath)
    end
end

And(/^I should see the "(.*)" for the "(.*)" in the Total Price column$/) do |total_prices, products|
    products_list = products.split(';').map(&:strip)
    prices_list = total_prices.split(';').map(&:strip)
    products_list.each_with_index do |product, index|
        total_price = prices_list[index]
        product_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2]/a/strong[normalize-space(text())='#{product}']"
        expect(page).to have_xpath(product_xpath)
        total_price_xpath = "#{product_xpath}/ancestor::tr[1]/td[5][normalize-space(text())='#{total_price}']"
        expect(page).to have_xpath(total_price_xpath)
    end
end

And(/^I should see the "(.*)" in the Product Total row$/) do |product_total|
    label_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[2][normalize-space(text())='Product Total']"
    expect(page).to have_xpath(label_xpath)
    product_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[3][normalize-space(text())='#{product_total}']"
    expect(page).to have_xpath(product_total_xpath)
end 

And(/^I should see the "(.*)" in the Sales Tax row$/) do |sales_tax|
    label_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[1][normalize-space(text())='Sales Tax']"
    expect(page).to have_xpath(label_xpath)
    sales_tax_xpath = "#{label_xpath}/ancestor::tr[1]/td[2][normalize-space(text())='#{sales_tax}']"
    expect(page).to have_xpath(sales_tax_xpath)
end 

#/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[7]/td[1]/strong
# /html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[7]/td[2]/strong
And(/^I should see the "(.*)" in the Grand Total row$/) do |grand_total|
    label_xpath = "/html/body/form/table/tbody/tr[1]/td/div/center/table/tbody/tr[*]/td[1]/strong[normalize-space(text())='Grand Total']"
    expect(page).to have_xpath(label_xpath)
    grand_total_xpath = "#{label_xpath}/ancestor::tr[1]/td[2]/strong[normalize-space(text())='#{grand_total}']"
    expect(page).to have_xpath(grand_total_xpath)
end 

When(/^I type the "(.*)" quantity for the following "(.*)" product for buying$/) do |quantity, product|  
    case product
        when "3 Person Dome Tent"
            fill_in 'QTY_TENTS', :with => quantity
        when "External Frame Backpack"
            fill_in 'QTY_BACKPACKS', :with => quantity
        when "Glacier Sun Glasses"
            fill_in 'QTY_GLASSES', :with => quantity
        when "Padded Socks"
            fill_in 'QTY_SOCKS', :with => quantity
        when "Hiking Boots"
            fill_in 'QTY_BOOTS', :with => quantity
        when "Back Country Shorts"
            fill_in 'QTY_SHORTS', :with => quantity
    end
    sleep 2
end

# aun no lo revise
When(/^I write "(.*)" in the input box of the product "(.*)"$/) do |quantity, product|
  within('body > form > table > tbody > tr:nth-child(2) > td > div > center > table') do
    row = find('tr', text: product)
    row.find('input[type="text"]').set(quantity)
  end
end

When(/^I write the quantities for the product with the table below$/) do | table |
    data = table.rows_hash  
    data.each_pair do |key, value|
        case key
            when "3 Person Dome Tent"
                fill_in 'QTY_TENTS', :with => value
            when "External Frame Backpack"
                fill_in 'QTY_BACKPACKS', :with => value
            when "Glacier Sun Glasses"
                fill_in 'QTY_GLASSES', :with => value
            when "Padded Socks"
                fill_in 'QTY_SOCKS', :with => value
            when "Hiking Boots"
                fill_in 'QTY_BOOTS', :with => value
            when "Back Country Shorts"
                fill_in 'QTY_SHORTS', :with => value
        end
    end
end

Then(/^I see the total price for each product$/) do
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    within(summary_table_selector) do
        rows = all("tr")
        rows.each_with_index do |row, index|
            next if index == 0
            cells = row.all('td')
            if cells.count == 5
                quantity = cells[0].text.strip.to_f
                unit_price = cells[3].text.strip.gsub(/[^\d\.]/, '').to_f
                total_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f

                expected_total_price = (unit_price * quantity).round(2)
                expect(total_price).to eq(expected_total_price)
            end
        end
    end
end

Then(/^I see the Product Total for all the products$/) do
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    within(summary_table_selector) do 
        rows = all("tr")
        expected_product_total = 0.0 
        rows.each_with_index do |row, index|
            next if index == 0
            cells = row.all('td')
            if cells.count == 5
                total_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f
                expected_product_total += total_price
            end
        end
        cells = rows[rows.count - 4].all('td') 
        product_total = cells[2].text.strip.gsub(/[^\d\.]/, '').to_f
        expect(product_total).to eq(expected_product_total.round(2))
    end
end

And(/^I see the correct Sales Tax for the order$/) do
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    within(summary_table_selector) do 
        rows = all("tr")
        expected_product_total = 0.0 
        rows.each_with_index do |row, index|
            next if index == 0
            cells = row.all('td')
            if cells.count == 5
                total_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f
                expected_product_total += total_price
            end
        end

        cells = rows[rows.count - 4].all('td') 
        product_total = cells[2].text.strip.gsub(/[^\d\.]/, '').to_f

        cells = rows[rows.count - 3].all('td') 
        sales_tax = cells[1].text.strip.gsub(/[^\d\.]/, '').to_f

        expected_sales_tax = (expected_product_total.round(2) * 0.05).round(2)
        expect(sales_tax).to eq(expected_sales_tax)
    end
end

And(/^I see the Grand Total calculated correctly$/) do
    summary_table_selector = "body > form:nth-child(3) > table:nth-child(2) > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > div:nth-child(1) > center:nth-child(1) > table:nth-child(1)"
    within(summary_table_selector) do 
        rows = all("tr")
        expected_product_total = 0.0 
        rows.each_with_index do |row, index|
            next if index == 0
            cells = row.all('td')
            if cells.count == 5
                total_price = cells[4].text.strip.gsub(/[^\d\.]/, '').to_f
                expected_product_total += total_price
            end
        end
        cells = rows[rows.count - 4].all('td') 
        product_total = cells[2].text.strip.gsub(/[^\d\.]/, '').to_f

        cells = rows[rows.count - 3].all('td') 
        sales_tax = cells[1].text.strip.gsub(/[^\d\.]/, '').to_f

        cells = rows[rows.count - 1].all('td') 
        grand_total = cells[1].text.strip.gsub(/[^\d\.]/, '').to_f

        expected_grand_total = (sales_tax + product_total + 5.0).round(2)
        expect(grand_total).to eq(expected_grand_total)
    end
end