class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
 
      # this line adds an integer column called `article_id`.
      t.references :article, index: true
      t.references :user, index: true
 
      t.timestamps null: false
    end
    
  end
end