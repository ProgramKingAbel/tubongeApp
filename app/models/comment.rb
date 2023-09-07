class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increase_comment_counter

  def increase_comment_counter
    post.increment!(:comments_counter)
  end
end
