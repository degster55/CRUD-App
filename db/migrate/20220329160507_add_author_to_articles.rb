class AddAuthorToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :author, null: false, foreign_key: true, index: true
  end
end
