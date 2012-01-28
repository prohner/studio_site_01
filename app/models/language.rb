# == Schema Information
# Schema version: 20120128143322
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Language < ActiveRecord::Base
end
