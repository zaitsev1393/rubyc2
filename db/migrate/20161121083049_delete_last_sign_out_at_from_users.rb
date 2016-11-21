class DeleteLastSignOutAtFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last_sign_out_at
  end
end
