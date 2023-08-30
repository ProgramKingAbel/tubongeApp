class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_author_posts_counter

  def update_author_posts_counter
    author.increment!(:posts_counter)
  end

  def top_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
