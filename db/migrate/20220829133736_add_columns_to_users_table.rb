class AddColumnsToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :status, :boolean, default: false
    add_column :users, :image_url, :string
  end
end
