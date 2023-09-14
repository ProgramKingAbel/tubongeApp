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

  let!(:comments) do
    [
      Comment.create(post: posts.first, author: user1, text: 'Hi Tom c1!'),
      Comment.create(post: posts.first, author: user1, text: 'Hi Tom c2!'),
      Comment.create(post: posts.first, author: user1, text: 'Hi Tom c3!')

    ]
  end

  describe 'user content and respective posts for that user' do
    before(:example) do
      visit user_posts_path(user1)
    end

    it 'displays user specific information' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.posts_counter)
      expect(page).to have_selector("img[src='#{user1.photo}']")
    end

    it 'Has a post\'s information' do
      expect(page).to have_content(posts.first.title)
      expect(page).to have_content(posts.first.text)
      expect(page).to have_content(posts[1].title)
      expect(page).to have_content(posts[1].text)
      expect(page).to have_content(posts[2].title)
      expect(page).to have_content(posts[2].text)
    end

    it 'displays the first few comments for each post' do
      expect(page).to have_content(comments.first.text)
    end

    it 'displays how many comments a post has' do
      expect(page).to have_content(comments.first.text)
    end

    it 'displays how many comments a post has' do
      expect(page).to have_content('Comments: 3')
    end

    it 'displays how many likes a post has ' do
      expect(page).to have_content(posts.first.likes_counter)
    end

    it 'redirects to the post show page when a post is clicked' do
      click_link posts.first.title
      expect(page).to have_content(posts.first.title)
    end

    it 'can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Pagination')
    end
  end
end
