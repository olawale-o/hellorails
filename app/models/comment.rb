# class Comment < ApplicationRecord
#   belongs_to :author, class_name: 'User'
#   belongs_to :post
# end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
