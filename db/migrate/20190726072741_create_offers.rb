class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.integer :incoming_funko_id
      t.integer :outcoming_funko_id
      t.string :status

      t.timestamps
    end
  end
end
