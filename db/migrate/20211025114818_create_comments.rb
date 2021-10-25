class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: { name: 'idx_comments_user_id' }
      t.references :post, null: false, index: { name: 'idx_comments_post_id' }
      t.text :text, null: false, default: 'short text'
      t.timestamps
    end
  end
end
