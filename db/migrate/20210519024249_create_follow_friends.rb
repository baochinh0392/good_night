class CreateFollowFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_friends do |t|
      t.references :user, null: false
      t.references :friend, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
