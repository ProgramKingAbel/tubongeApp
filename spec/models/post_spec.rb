require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Sample Post', author: User.create(name: 'Morara'), comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid with a blank title' do
    subject.title = ''
    expect(subject).not_to be_valid
  end

  it 'is invalid with a title exceeding 250 characters' do
    subject.title = 'A' * 251
    expect(subject).not_to be_valid
  end

  it 'is invalid if comments_counter is not an integer' do
    subject.comments_counter = 1.24
    expect(subject).not_to be_valid
  end

  it 'is not valid if comments_counter is negative' do
    subject.comments_counter = -2
    expect(subject).not_to be_valid
  end

  it 'is invalid if likes_counter is not an integer' do
    subject.likes_counter = 1.24
    expect(subject).not_to be_valid
  end

  it 'is not valid if likes_counter is negative' do
    subject.likes_counter = -2
    expect(subject).not_to be_valid
  end

  describe '#update_author_posts_counter' do
    it 'increments the author\'s posts_counter' do
      expect { subject.update_author_posts_counter }.to change { subject.author.posts_counter }.by(1)
    end
  end

  describe '#top_five_comments' do
    it 'returns the five most recent comments' do
      user = User.create(name: 'Morara')
      Comment.create(author: user, post: subject, text: 'comment1', created_at: 5.days.ago)
      comment2 = Comment.create(author: user, post: subject, text: 'comment2', created_at: 4.days.ago)
      comment3 = Comment.create(author: user, post: subject, text: 'comment3', created_at: 3.days.ago)
      comment4 = Comment.create(author: user, post: subject, text: 'comment4', created_at: 2.days.ago)
      comment5 = Comment.create(author: user, post: subject, text: 'comment5', created_at: 1.day.ago)
      comment6 = Comment.create(author: user, post: subject, text: 'comment6', created_at: Time.now)

      result = subject.top_five_comments

      expected_order = [comment6, comment5, comment4, comment3, comment2]

      expect(result).to eq(expected_order)
    end
  end
end
