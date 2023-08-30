require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Abel Morara', posts_counter: 5) }

  before { subject.save }
end
