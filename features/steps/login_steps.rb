Given(/^I am in Gmail$/) do
  @browser.goto("https://gmail.com")
  if @browser.link(:text =>"Sign in").present?
    @browser.link(:text =>"Sign in").click
  end
end

When(/^I enter invalid username$/) do
  username = @browser.text_field(:id, "Email")
  username.set 'Shinok'
  if @browser.button(:id =>"next").present?
    @browser.button(:id =>"next").click
  end
end

And(/^I enter invalid password$/) do
  password = @browser.text_field(:id, "Passwd")
  password.set 'Shinok'
end

Then(/^I should see error message$/) do
  @browser.button(:id => 'signIn').click
end