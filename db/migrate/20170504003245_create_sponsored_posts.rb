class CreateSponsoredPosts < ActiveRecord::Migration
  def change
    #drop_table :sponsored_posts
    create_table :sponsored_posts do |t|
      t.string :title
      t.text :body
      t.integer :price
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
