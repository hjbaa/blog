class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :description
      t.references :author, null: false, foreign_key: { to_table: :users, column: :id }

      t.timestamps
    end
  end
end
