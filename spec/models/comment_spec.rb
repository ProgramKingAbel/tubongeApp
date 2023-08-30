require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Morara') }
  let(:post) { Post.create(title: 'Sample Post', author: user) }

  subject { Comment.new(author: user, post:) }

  before { subject.save }

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

  describe '#increase_comment_counter' do
    it 'increments the post\'s comments_counter from 0' do
      expect { subject.increase_comment_counter }.to change { subject.post.comments_counter }.by(1)
    end
  end
end
