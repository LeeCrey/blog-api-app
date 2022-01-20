class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30, null: false
      t.string :last_name, limit: 30
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
