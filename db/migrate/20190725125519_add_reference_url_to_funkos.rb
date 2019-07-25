class AddReferenceUrlToFunkos < ActiveRecord::Migration[5.2]
  def change
    add_column :funkos, :reference_url, :string
  end
end
