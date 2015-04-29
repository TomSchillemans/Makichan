class User < ActiveRecord::Base
  include Gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  gravtastic :default => 'identicon'

  has_many :pins, :dependent => :delete_all
  has_one :profile, :dependent => :delete
  before_create :build_profile
end
