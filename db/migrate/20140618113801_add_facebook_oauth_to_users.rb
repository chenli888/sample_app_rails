class AddFacebookOauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_token, :string
    add_index :users, :facebook_token
    add_column :users, :facebook_expire, :datetime
  end
end
