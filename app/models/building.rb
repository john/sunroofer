class Building < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_taggable

  belongs_to :roof_set
  belongs_to :user
  validates :name, presence: true

  WATTS_PER_SQ_FT = 14

  scope :geolocated, -> { where('latitude IS NOT NULL') }

  def create_sunroof_url
    address = "#{self.address}, #{self.city}, #{self.state} #{self.zipcode}".gsub(' ', '%20')
    "https://www.google.com/get/sunroof#a=#{address},%20USA&b=90&f=buy&np=14&p=1"
  end

  # TODO: are we talking AC or DC kilowatts here?
  def kW
    self.roof_sq_feet.present? ? (self.roof_sq_feet * Building::WATTS_PER_SQ_FT) / 1000 : nil
  end

  def kWh_yr
    self.kW.present? && self.sunlight_hours.present? ? (self.kW * self.sunlight_hours) : nil
  end

  # https://www.electricitylocal.com/states/california/san-francisco/
  def savings
    self.kWh_yr.present? ? self.kWh_yr * 0.09 : nil
  end
  
end
