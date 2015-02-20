class AddCityToPlanes < ActiveRecord::Migration
  def change
    add_column :planes, :city, :string
  end
end
