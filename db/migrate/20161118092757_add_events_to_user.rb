class AddEventsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :events, :string, array: true, default: '{}'
  end
end
