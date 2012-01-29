# == Schema Information
# Schema version: 20120129045843
#
# Table name: styles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  country_id :integer
#  studio_id  :integer
#

class Style < ActiveRecord::Base
  belongs_to :country
  belongs_to :studio
  
  has_many :terms
end
