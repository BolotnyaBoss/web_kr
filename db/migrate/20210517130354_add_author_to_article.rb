class AddAuthorToArticle < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :author,  foreign_key: { to_table: :models }
  end
end
