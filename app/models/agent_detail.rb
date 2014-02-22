class AgentDetail < ActiveRecord::Base
  
  belongs_to :agent

  validates_presence_of :name, :address_1, :town, :postcode, :main_phone, :email
  validates :email, email: true
  validates :main_phone, :alt_phone, :fax, phone_number: true
  validates :postcode, postcode: true
  validates :website, url: true

end
