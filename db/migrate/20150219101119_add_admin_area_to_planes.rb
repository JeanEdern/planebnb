class AddAdminAreaToPlanes < ActiveRecord::Migration
  def change
    add_column :planes, :admin_area, :string
  end
end
