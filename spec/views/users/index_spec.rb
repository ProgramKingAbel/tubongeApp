require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'User index page' do
    before do
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user)
        .and_return(User.create(name: 'James', photo: 'https://placehold.co/100x100', bio: 'Program tester',
                                posts_counter: 1))
      @first_user = User.create(name: 'Test', photo: 'https://placehold.co/105x105', bio: 'Fullstack developer')
      User.create(name: 'Abel', photo: 'https://placehold.co/110x110', bio: 'Fullstack developer')
      visit root_path
    end

    it 'Shows the right content' do
      expect(page).to have_content(@first_user.name)
    end

    it 'Can see the username of all other users' do
      expect(page).to have_content('Test')
      expect(page).to have_content('Abel')
      expect(page).to have_content('James')
    end

    it 'Can see the profile picture for each user' do
      expect(page).to have_css("img[src='https://placehold.co/105x105']")
      expect(page).to have_xpath("//img[contains(@src,'https://placehold.co/105x105')]")
      expect(page).to have_css("img[src='https://placehold.co/110x110']")
    end

    it 'Can see the number of posts written by each user' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'Redirects to the user show page when a user is clicked' do
      click_link 'Test'
      expect(page).to have_current_path(user_path(@first_user))
    end
  end
end
