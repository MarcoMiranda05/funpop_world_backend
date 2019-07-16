class CreateFunkos < ActiveRecord::Migration[5.2]
  def change
    create_table :funkos do |t|
      t.string :name
      t.string :fandom
      t.string :image_url
      t.date :release_date
      t.string :category
      t.integer :item_number

      t.timestamps
    end
  end
end
