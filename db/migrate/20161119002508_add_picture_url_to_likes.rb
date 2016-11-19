class AddPictureUrlToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :picture_url, :string
  end
end
