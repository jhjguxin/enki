class Attachment < ActiveRecord::Base
  belongs_to :post
  has_attached_file :image,
    :styles => {
      :thumb=> "100x100#",
      :small  => "300x300>",
      :large => "600x600>"
        }

end
