class RoofSet < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user
  has_many :buildings
  validates :name, presence: true
  
  include CSVUploader::Attachment.new(:csv)
  
  def total_square_ft
    self.buildings.map{|b| b.roof_sq_feet}.compact.sum
  end
  
  def total_kw
    (self.total_square_ft * Building::WATTS_PER_SQ_FT) / 1000 
  end
  
  def total_kWh
    self.buildings.map{|b| b.kWh_yr }.compact.sum
  end
end
