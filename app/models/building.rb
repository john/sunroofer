class Building < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
    
  belongs_to :roof_set
  validates :name, presence: true
end
