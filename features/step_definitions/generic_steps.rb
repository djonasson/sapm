Then(/^I should see a successful (\w+) creation message$/) do |name|
  page.should have_content "Successfully created #{name}"
end

Then(/^I should see a successful (\w+) updated message$/) do |name|
  page.should have_content "Successfully updated #{name}"
end

Then(/^I should see a (\w+) successfully deleted message$/) do |name|
  page.should have_content "Successfully deleted #{name}"
end
