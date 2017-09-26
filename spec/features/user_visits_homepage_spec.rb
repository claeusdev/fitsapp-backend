require 'rails_helper'

feature 'user_visits_homepage' do
	scenario 'successfully' do
		visit root_path

		expect(page).to have_css 'h1'
	end
end