# class Comment < ApplicationRecord
#   belongs_to :author, class_name: 'User'
#   belongs_to :post
# end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :comments_counter

  before_validation :trim_text

  # class method to update comments counter for every time a post is commented on
  def self.update_post_comments_counter(comment_id)
    post = Comment.find(comment_id).post
    post.update_column('comments_counter', post.comments_counter + 1)
  end

  # instance method to update comments counter for every time a post is commented on
  def update_post_comments_counter
    post.update_column('comments_counter', post.comments_counter + 1)
  end

  def trim_text
    text.strip! if text.present?
  end
end
