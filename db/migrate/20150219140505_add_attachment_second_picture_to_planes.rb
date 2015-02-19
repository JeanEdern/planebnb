class AddAttachmentSecondPictureToPlanes < ActiveRecord::Migration
  def self.up
    change_table :planes do |t|
      t.attachment :second_picture
    end
  end

  def self.down
    remove_attachment :planes, :second_picture
  end
end
