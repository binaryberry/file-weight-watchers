require 'spec_helper'

feature "User logs in" do
	scenario "when browsing the homepage" do
		visit '/'
		expect(page).to have_text ("Welcome to File Weight Watchers")
		page.fill_in 'email', with: 'tatiana.soukiassian@gmail.com'
		page.fill_in 'email', with: 'carrots'
		click_on 'Log in'
		expect(page).to have_text ("Here is the breakdown of your file's weight")
	end

end
