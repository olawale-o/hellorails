# class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   has_many :created_posts, class_name: 'Post', foreign_key: :author_id
#   has_many :comments, foreign_key: :author_id, class_name: 'Comment'
#   has_many :posts, through: :comments
#   has_many :likes, foreign_key: :author_id, class_name: 'Like'
#   has_many :posts, through: :likes
# end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  validates :name, presence: { message: 'Name must not be blank' }
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal: 0

  # These gets only all the posts created by a specific user
  has_many :created_posts, class_name: 'Post'
  # these gets all the comments made by a specific user
  has_many :comments
  # these gets all the posts created by a specifc user that has been commented on
  has_many :commented_posts, through: :comments, source: :user, class_name: 'Comment'
  # these gets all the likes of a specific user
  has_many :likes, class_name: 'Like'
  # these gets all the posts liked by a specifc user
  has_many :posts, through: :likes

  # These gets all the recent psots of a user
  scope :top_three_posts_of_user, ->(id, total) { find(id).created_posts.order('created_at DESC').limit(total) }

  # class method to get top three posts a given user
  def self.top_three_posts(args)
    User.find_by(args).created_posts.order('created_at DESC').limit(3)
  end

  # instance method to get top three posts for a given user
  def top_three_posts(limit = 3)
    created_posts.order(created_at: :desc).limit(limit)
  end
end
