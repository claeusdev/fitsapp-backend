require 'rails_helper'

feature 'user signs up' do
	scenario 'successfully' do
		visit new_user_registration_path

		fill_in 'Username', with: 'username'
		fill_in 'Email', with: 'email@email.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password Confirmation', with: 'password'
		click_button 'Sign Up'

		expect(page).to have_content 'Welcome! You have signed up successfully.'
	end
end