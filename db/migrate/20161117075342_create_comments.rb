class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :user
      t.belongs_to :picture

      t.timestamps
    end
  end
end
