class AddRoleToModel < ActiveRecord::Migration[6.1]
  def change
    add_column :models, :role, :integer, null: false, default: 0
  end
end
