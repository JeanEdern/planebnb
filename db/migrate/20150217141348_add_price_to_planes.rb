class AddPriceToPlanes < ActiveRecord::Migration
  def change
    add_column :planes, :price, :integer
  end
end
