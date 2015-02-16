class AddAttachmentPictureToPlanes < ActiveRecord::Migration
  def self.up
    change_table :planes do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :planes, :picture
  end
end
