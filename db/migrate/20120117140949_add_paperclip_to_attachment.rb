class AddPaperclipToAttachment < ActiveRecord::Migration
  def self.up
    add_column :attachments, :image_file_name, :string
    add_column :attachments, :image_content_type, :string
    add_column :attachments, :image_file_size, :integer
  end

  def self.down
    remove_column :attachments, :image_file_size
    remove_column :attachments, :image_content_type
    remove_column :attachments, :image_file_name
  end
end
