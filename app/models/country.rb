# == Schema Information
# Schema version: 20120128143322
#
# Table name: countries
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  flag_image_url :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Country < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :styles
end
