class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users, column: :id }
      t.references :followed_blogger, null: false, foreign_key: { to_table: :users, column: :id }
      t.index %i[follower_id followed_blogger_id], unique: true

      t.timestamps
    end
  end
end
