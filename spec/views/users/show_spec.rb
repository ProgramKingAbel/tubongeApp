require 'rails_helper'

RSpec.describe 'user index view page', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://lumiere-a.akamaihd.net/v1/images/ct_cinderella_upcportalreskin_20694_f7c876a1.jpeg?region=0,0,330,330',
      bio: 'Mic testing one two one two',
      posts_counter: 1
    )
  end

  let!(:posts) do
    [
      Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 1, likes_counter: 1),
      Post.create(author: user1, title: 'Post 2', text: 'Post 2 content', comments_counter: 2, likes_counter: 2),
      Post.create(author: user1, title: 'Post 3', text: 'Post 3 content', comments_counter: 3, likes_counter: 3)
    ]
  end

  describe 'user content and respective posts for that user' do
    before(:example) do
      visit user_path(user1)
    end

    it 'displays user specific information' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.bio)
      expect(page).to have_content(user1.posts_counter)
      expect(page).to have_selector("img[src='#{user1.photo}']")
    end

    it 'Can see the user first 3 posts' do
      expect(page).to have_content('Post 1 content')
      expect(page).to have_content('Post 2 content')
      expect(page).to have_content('Post 3 content')
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Post 3')
    end

    it 'Displays a see more button to display all posts' do
      expect(page).to have_link('See All Posts')
    end

    it 'Redirects to the user post index page' do
      click_link 'See All Posts'
      expect(page).to have_current_path(user_posts_path(user1))
    end

    it 'Redirects to the post#show page when a user post clicked' do
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(user1, posts[0]))
    end
  end
end
