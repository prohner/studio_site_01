# == Schema Information
# Schema version: 20120128143322
#
# Table name: terms
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  translated_term   :string(255)
#  phonetic_spelling :string(255)
#  definition        :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class Term < ActiveRecord::Base
  belongs_to :style

end
