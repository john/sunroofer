class RoofSet < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user
  has_many :buildings
  validates :name, presence: true
  
  include CSVUploader::Attachment.new(:csv)
end
