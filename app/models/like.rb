class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # class method to update likes counter for every time a post is liked on
  def self.update_post_likes_counter(like_id)
    post = Like.find(like_id).post
    post.update_column('likes_counter', post.likes_counter + 1)
  end

  # instance method to update likes counter for every time a post is liked on
  def update_post_likes_counter
    post.update_column('likes_counter', post.likes_counter + 1)
  end
end
