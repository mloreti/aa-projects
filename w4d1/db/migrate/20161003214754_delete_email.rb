class DeleteEmail < ActiveRecord::Migration
  def change
    remove_column :users, :email
    change_column :users, :name, :username, unique: true
  end
end
