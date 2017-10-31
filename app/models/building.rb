class Building < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
    
  belongs_to :roof_set
  validates :name, presence: true
  
  def create_sunroof_url
    address = "#{self.address}, #{self.city}, #{self.state} #{self.zipcode}".gsub(' ', '%20')
    "https://www.google.com/get/sunroof#a=#{address},%20USA&b=90&f=buy&np=14&p=1"
  end
  
end
