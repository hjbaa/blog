class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.string :title, null: false
      t.references :author, null: false, foreign_key: { to_table: :users, column: :id }
      t.references :diary, null: false

      t.timestamps
    end
  end
end
