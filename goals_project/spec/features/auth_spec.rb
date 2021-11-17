require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
  visit new_user_url
  expect(page).to have_content "Sign Up"
  end
  feature 'signing up a user' do


      before(:each) do
        visit new_user_url
        fill_in 'username', :with => "John Smith"
        fill_in 'password', :with => "biscuits"
        click_on "Sign up"
      end
  
    scenario 'shows username on the homepage after signup' do

      expect(page).to have_content "Welcome John Smith"
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
  login_as('John Smith')
  expect(page).to have_content "Welcome John Smith"
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
  visit goals_url
  expect(page).to have_content "Log in"
  end
  scenario 'doesn\'t show username on the homepage after logout' do
  login_as('John Smith')
  click_button 'Log Out'
  expect(page).not_to have_content "John Smith"
  end
end