class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :content, null: false
      t.integer :sub_id, null: false
      t.integer :author_id, null: false

      t.index [:sub_id, :author_id]
      t.timestamps null: false
    end
  end
end
