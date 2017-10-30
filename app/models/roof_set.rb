class RoofSet < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
    
  has_many :buildings
  validates :name, presence: true
  
  include CSVUploader[:csv]
end
