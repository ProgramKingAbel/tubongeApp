require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Abel Morara', posts_counter: 5) }

  before { subject.save }

  it 'is valid with correct attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid with null name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is invalid if posts_counter is not an integer' do
    subject.posts_counter = 1.24
    expect(subject).not_to be_valid
  end

  it 'is not valid if posts_Counter is negative' do
    subject.posts_counter = -2
    expect(subject).not_to be_valid
  end
end
