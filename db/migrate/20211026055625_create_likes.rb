# class CreateLikes < ActiveRecord::Migration[6.1]
#   def change
#     create_table :likes do |t|
#       t.references :author, null: false, foreign_key: { to_table: :users }, index: { name: 'idx_likes_user_id' }
#       t.references :post, null: false, index: { name: 'idx_likes_post_id' }
#       t.timestamps
#     end
#   end
# end

class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :post, null: false, foreign_key: true, index: true
      t.timestamps
    end
  end
end
