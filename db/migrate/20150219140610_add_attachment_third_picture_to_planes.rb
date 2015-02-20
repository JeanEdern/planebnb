class AddAttachmentThirdPictureToPlanes < ActiveRecord::Migration
  def self.up
    change_table :planes do |t|
      t.attachment :third_picture
    end
  end

  def self.down
    remove_attachment :planes, :third_picture
  end
end
