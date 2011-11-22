class CreateViews < ActiveRecord::Migration
  def self.up
    create_table :views, :id => false do |t|
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end

  def self.down
    drop_table :views
  end
end
