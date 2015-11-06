Given(/^I am in Gmail$/) do
  @browser.goto("https://gmail.com")
  if @browser.link(:text =>"Sign in").present?
    @browser.link(:text =>"Sign in").click
  end
end

When(/^I enter invalid username$/) do
  username = @browser.text_field(:id, "Email")
  username.when_present.set 'Shinok'
  if @browser.button(:id =>"next").present?
    @browser.button(:id =>"next").click
  end
end

And(/^I enter invalid password$/) do
  password = @browser.text_field(:id, "Passwd")
  password.when_present.set 'Shinok'
end

Then(/^I should see error message$/) do
  @browser.button(:id => 'signIn').when_present.click
  @browser.span(:id=>'errormsg_0_Passwd').text.include? "The email and password you entered don't match."
end