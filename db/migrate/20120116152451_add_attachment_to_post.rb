class AddAttachmentToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :attachment_file_name, :string
    add_column :posts, :attachment_content_type, :string
    add_column :posts, :attachment_file_size, :integer
    add_column :posts, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :posts, :attachment_file_name
    remove_column :posts, :attachment_content_type
    remove_column :posts, :attachment_file_size
    remove_column :posts, :attachment_updated_at
  end
end
