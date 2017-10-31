Given(/^I am a user and I go to sign in page$/) do
  @user = FactoryGirl.create :existing1member
  @user = FactoryGirl.create :existing1
end

Given(/^I provide email and password and sign in$/) do
  visit '/users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Sign in'
  expect(page).to have_content "Signed in successfully."
end

Then(/^I go to add ride as a passenger page$/) do
  visit 'passengerrides/new'
end

Then(/^I enter origin details$/) do
  find("input[id$='txtautocomplete']").set('Victory Monument')
end

Then(/^I enter destination details$/) do
  find("input[name$='passengerride[destination]']").set('Pathumthani')
end

Then(/^I enter departure date and time$/) do
  fill_in 'Departure Date', :with => '12/12/2016'
  #find("input[id$='driverride_departuretime_4i']").find(:xpath, '15').select_option
  select "00", :from => "passengerride_departuretime_4i"
end

Then(/^I select the gender of the driver i would like to travel$/) do
  check('Any Gender')
end

Then(/^I select what i'm be ok with$/) do
  check('Music')
end

Then(/^I select whether I would like to share gas price or not$/) do
  choose('Yes')
end

Then(/^I submit form$/) do
  click_button 'Create Passengerride'
end

Then(/^I should be redirected to the new ride page and see my ride$/) do
  save_and_open_page
  expect(page).to have_content "Pathumthani"
end
