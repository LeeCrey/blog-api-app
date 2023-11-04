class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :cached_votes_up, null: false, default: 0
      t.integer :comments_count, null: false, default: 0

      t.timestamps
    end
  end
end
