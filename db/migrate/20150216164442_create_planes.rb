class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.references :user, index: true
      t.text :description
      t.integer :seat
      t.string :aeroclub
      t.boolean :available

      t.timestamps null: false
    end
    add_foreign_key :planes, :users
  end
end
