# class User < ApplicationRecord
#   has_many :created_posts, class_name: 'Post', foreign_key: :author_id
#   has_many :comments, foreign_key: :author_id, class_name: 'Comment'
#   has_many :posts, through: :comments
#   has_many :likes, foreign_key: :author_id, class_name: 'Like'
#   has_many :posts, through: :likes
# end

class User < ApplicationRecord
  # These gets only all the posts created by a specific user
  has_many :created_posts, class_name: 'Post'
  # these gets all the comments made by a specific user
  has_many :comments
  # these gets all the posts created by a specifc user that has been commented on
  has_many :commented_posts, through: :comments, source: :user, class_name: 'Comment'
  # these gets all the likes of a specific user
  has_many :likes, class_name: 'Like'
  # hese gets all the posts liked by a specifc user
  has_many :posts, through: :likes
end
