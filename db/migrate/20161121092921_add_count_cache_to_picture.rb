class AddCountCacheToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :likes_count, :integer, :default => 0

    Picture.reset_column_information
    Picture.find_each do |picture|
      Picture.reset_counters picture.id, :likes
    end
  end
end
