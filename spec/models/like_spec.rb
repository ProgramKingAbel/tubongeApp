require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author: User.create(name: 'Morara'), post: Post.create(title: 'Sample Post')) }

  before { subject.save }

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

  describe '#update_likes_counter' do
    it 'increments the post\'s likes_counter' do
      expect { subject.update_likes_counter }.to change { subject.post.likes_counter }.by(1)
    end
  end
end
