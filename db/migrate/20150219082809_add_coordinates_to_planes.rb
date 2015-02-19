class AddCoordinatesToPlanes < ActiveRecord::Migration
  def change
    add_column :planes, :latitude, :float
    add_column :planes, :longitude, :float
  end
end
