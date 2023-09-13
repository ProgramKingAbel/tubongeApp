require 'rails_helper'

RSpec.describe 'user index view page', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrkfBY9UTdiEHSYCSo7iuM4k1Eyv-u9YwGqQ&usqp=CAU',
      bio: 'Mic testing one two one two',
      posts_counter: 1
    )
  end

  let!(:user2) do
    User.create(
      name: 'test user2',
      photo: 'https://lumiere-a.akamaihd.net/v1/images/ct_cinderella_upcportalreskin_20694_f7c876a1.jpeg?region=0,0,330,330',
      bio: 'Hello doing some tests here',
      posts_counter: 10
    )
  end

  let!(:user3) do
    User.create(
      name: 'test user3',
      photo: 'https://www.rd.com/wp-content/uploads/2020/11/RD-mickey-mouse-GettyImages-1137134597-JVcrop.jpg',
      bio: 'Test 3 is done here',
      posts_counter: 20
    )
  end

  describe 'user content' do
    before(:example) do
      visit users_path
    end

    it 'can see all users names' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(user3.name)
    end

    it 'can see posts count' do
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Number of posts: 10')
      expect(page).to have_content('Number of posts: 20')
    end

    it 'can see the profile picture for each user' do
      expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrkfBY9UTdiEHSYCSo7iuM4k1Eyv-u9YwGqQ']")
      expect(page).to have_css("img[src*='https://lumiere-a.akamaihd.net/v1/images/ct_cinderella_upcportalreskin_20694_f7c876a1.jpeg?region=0,0,330,330']")
      expect(page).to have_css("img[src*='https://www.rd.com/wp-content/uploads/2020/11/RD-mickey-mouse-GettyImages-1137134597-JVcrop.jpg']")
    end
  end

  it 'redirects to the user\'s show page' do
    visit user_path(user1)
    expect(page).to have_current_path(user_path(user1))
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user1.bio)
  end
end