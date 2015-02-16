class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :planes, :users
  end
end
