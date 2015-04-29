class Pin < ActiveRecord::Base
  belongs_to :user

  acts_as_votable
  acts_as_taggable_on :tags, :aditional_tags

  #TODO Add image source field

  has_attached_file :image, processors: [:thumbnail, :paperclip_optimizer]
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
