class ModifyProductsQuantityStores < ActiveRecord::Migration
  def change
    add_column :products, :quantity_online, :integer, default: 1
    add_column :products, :quantity_store, :integer, default: 1
  end
end
