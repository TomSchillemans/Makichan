class Pin < ActiveRecord::Base
  acts_as_votable
  acts_as_taggable

  belongs_to :user

  has_attached_file :image

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
