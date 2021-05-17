class AddAuthornameToModel < ActiveRecord::Migration[6.1]
  def change
    add_column :models, :username, :string
  end
end
