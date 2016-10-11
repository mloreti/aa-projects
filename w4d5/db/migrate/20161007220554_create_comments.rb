class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :author_id, null: false
      t.integer :post_id, null: false
      t.integer :parent_comment_id
      t.index [:author_id, :post_id, :parent_comment_id]
      t.timestamps null: false
    end
    
  end
end
