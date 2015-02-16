class AddAttachmentLicensePictureToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :license_picture
    end
  end

  def self.down
    remove_attachment :users, :license_picture
  end
end
