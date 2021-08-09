class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :status
      t.integer :total
      t.string :merchant_order_id
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
