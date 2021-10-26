# class Post < ApplicationRecord
#   belongs_to :creator, foreign_key: :author_id, class_name: 'User'
#   has_many :comments
#   has_many :users, through: :comments, source: :author, foreign_key: :author_id
#   has_many :likes
#   has_many :users, through: :likes, source: :author, foreign_key: :author_id
# end

class Post < ApplicationRecord
  # these gets user that created a specific post
  belongs_to :user
  # these gets all the comments made on a specific post
  has_many :comments
  # these gets all the users that made comments on a specific post
  has_many :user_comments, through: :comments, source: :post, class_name: 'Comment'
  # these gets all the likes for a specific post
  has_many :likes
  # these gets all the users that liked a specific post
  has_many :users, through: :likes
end
