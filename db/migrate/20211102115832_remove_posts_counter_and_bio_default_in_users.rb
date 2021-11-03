class RemovePostsCounterAndBioDefaultInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :bio, nil
    change_column_default :users, :posts_counter, nil
  end
end
