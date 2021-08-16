class RenameTotalinOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column(:orders, :quantity, :subtotal)
    add_column(:product_orders, :total, :integer)
  end
end
