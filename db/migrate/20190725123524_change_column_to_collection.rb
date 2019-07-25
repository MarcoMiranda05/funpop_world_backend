class ChangeColumnToCollection < ActiveRecord::Migration[5.2]
  def change
    change_column :collections, :available_to_trade, :boolean, :default => false
  end
end
