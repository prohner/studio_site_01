require 'digest'
# == Schema Information
# Schema version: 20120130050951
#
# Table name: studios
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  address            :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  address2           :string(255)
#  city               :string(255)
#  state              :string(255)
#  postal_code        :string(255)
#  phone              :string(255)
#  fax                :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#

class Studio < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  attr_accessor :password

  has_many :styles

  validates :name,  :presence => true
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
  
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(name, submitted_password) 
    studio = find_by_name(name)
    return nil if studio.nil?
    return studio if studio.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    studio = find_by_id(id)
    (studio && studio.salt == cookie_salt) ? studio : nil
  end
  
  before_save :encrypt_password
  
  private
  
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
      
    end
end
