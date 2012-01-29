# == Schema Information
# Schema version: 20120128143322
#
# Table name: studios
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  address     :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  address2    :string(255)
#  city        :string(255)
#  state       :string(255)
#  postal_code :string(255)
#  phone       :string(255)
#  fax         :string(255)
#

class Studio < ActiveRecord::Base
  has_many :styles
end
