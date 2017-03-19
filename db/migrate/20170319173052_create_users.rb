class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :email
      t.string :oauth_token
      t.string :image_path
      t.datetime :oauth_expires_at
      # add_index :users, :provider
      # add_index :users, :uid
      # add_index :users, [:provider, :uid], unique: true
      t.timestamps
    end
  end
end