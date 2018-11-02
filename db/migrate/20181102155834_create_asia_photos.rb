class CreateAsiaPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :asia_photos do |t|
      t.string :image, null: false
      t.string :caption, null: false
      t.string :country
      t.string :description
      t.string :date

      t.timestamps null: false
    end
  end
end
