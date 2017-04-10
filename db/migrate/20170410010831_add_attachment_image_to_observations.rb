class AddAttachmentImageToObservations < ActiveRecord::Migration
  def self.up
    change_table :observations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :observations, :image
  end
end
