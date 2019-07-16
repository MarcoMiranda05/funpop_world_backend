class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.references :funko, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :available_to_trade

      t.timestamps
    end
  end
end
