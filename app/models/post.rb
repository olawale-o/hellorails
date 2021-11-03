# class Post < ApplicationRecord
#   belongs_to :creator, foreign_key: :author_id, class_name: 'User'
#   has_many :comments
#   has_many :users, through: :comments, source: :author, foreign_key: :author_id
#   has_many :likes
#   has_many :users, through: :likes, source: :author, foreign_key: :author_id
# end

class Post < ApplicationRecord
  validates :title, presence: { message: 'Title must not be blank' },
                    length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal: 0
  validates_numericality_of :likes_counter, only_integer: true, greater_than_or_equal: 0

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
  # enforce presence of user on specific post creation
  validates_associated :user
  # select all post other than the first post
  scope :not_id_of_one, -> { where('id != 1') }
  # get all posts and order by created_at
  scope :by_creation, ->(post_id) { where('id = ?', post_id).order('created_at DESC') }

  def self.update_post_counter(id)
    post = Post.find(id)
    user = post.user
    user.update_column('posts_counter', user.posts_counter + 1)
  end

  def update_post_counter
    user.update_column('posts_counter', user.posts_counter + 1)
  end

  # class method to get top 5 comments for a given post
  def self.five_most_recent_comments(post_id)
    post = Post.find(post_id)
    post.comments.order('created_at DESC').limit(5)
  end

  # instance method to get top 5 comments for a given post
  def five_most_recent_comments
    comments.order('created_at DESC').limit(5)
  end

  # auto update comments_counter for existing post
  # def self.update_comments_counter(post_id)
  #   post = Post.find(post_id)
  #   total_comments = post.comments.size
  #   post.update_column('comments_counter', total_comments)
  # end
end
