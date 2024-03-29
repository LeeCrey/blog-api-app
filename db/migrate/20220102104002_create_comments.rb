class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post, null: false, foreign_key: true
      t.text :content
      t.integer :cached_votes_up, null: false, default: 0
      t.integer :replies_count, null: false, default: 0

      t.timestamps
    end
  end
end
