class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :art_title
      t.text :description
      t.integer :user_id
      t.integer :count
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
