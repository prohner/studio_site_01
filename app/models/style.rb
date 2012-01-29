# == Schema Information
# Schema version: 20120128143322
#
# Table name: styles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Style < ActiveRecord::Base
  belongs_to :country
  belongs_to :studio
end
