class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
 extend FriendlyId
 friendly_id :name, use: :slugged
 
 acts_as_tagger
 
 has_many :roof_sets
 
end
