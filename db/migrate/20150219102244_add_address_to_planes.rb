class AddAddressToPlanes < ActiveRecord::Migration
  def change
    add_column :planes, :address, :string
  end
end
