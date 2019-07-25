class AddColumnsToFunkos < ActiveRecord::Migration[5.2]
  def change
    add_column :funkos, :trending_value, :integer
    add_column :funkos, :exclusivity, :string
  end
end
