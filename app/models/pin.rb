class Pin < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  has_attached_file :image,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join('config/dropbox.yml')

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
