class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :total_price, default: 0
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
