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

  let!(:post1) do
    Post.create(author: user1, title: 'Post 1', text: 'Post 1 content', comments_counter: 1, likes_counter: 1)
  end

  let!(:comments) do
    [
      Comment.create(post: post1, author: user1, text: 'Hi Tom c1!'),
      Comment.create(post: post1, author: user1, text: 'Hi Tom c2!'),
      Comment.create(post: post1, author: user1, text: 'Hi Tom c3!')

    ]
  end

  describe 'user content and respective posts for that user' do
    before(:example) do
      visit user_post_path(user1, post1)
    end

    it 'shows posts title' do
      expect(page).to have_content(post1.title)
    end
    it 'shows posts author of the post' do
      expect(page).to have_content(user1.name)
    end

    it 'Can see the post body' do
      expect(page).to have_content(post1.text)
    end

    it 'shows posts comments and likes' do
      expect(page).to have_content("Comments: #{post1.comments_counter}")
      expect(page).to have_content("Likes: #{post1.likes_counter}")
    end
    it 'shows posts commenters or authors of comments' do
      expect(page).to have_content(comments[0].author.name)
      expect(page).to have_content(comments[1].author.name)
      expect(page).to have_content(comments[2].author.name)
    end
    it 'shows posts comments' do
      expect(page).to have_content(comments[0].text)
      expect(page).to have_content(comments[1].text)
      expect(page).to have_content(comments[2].text)
    end
  end
end
