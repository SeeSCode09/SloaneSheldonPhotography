class AddColumnToCreateAfricaPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :africa_photos, :order, :string
  end
end
