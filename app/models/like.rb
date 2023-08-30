class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def increment_likes_counter
    post.increment!(:likes_counter)
  end
end
