class CreateOauthProviders < ActiveRecord::Migration
  def change
    create_table :oauth_providers do |t|
      t.integer :user_id
      t.string :name
      t.string :uid
      t.timestamps null: false
    end
  end
end
