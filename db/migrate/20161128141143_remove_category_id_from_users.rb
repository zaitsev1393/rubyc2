class RemoveCategoryIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :category_id
  end
end
