class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, unique: true
      t.string :long_url, null: false
      t.string :user_id, null: false
      t.timestamps
    end
    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :long_url, unique: true
  end
end
