class AddAddressAndPhoneToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
  end
end
