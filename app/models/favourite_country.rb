class FavouriteCountry < ActiveRecord::Base

  belongs_to :agent
  belongs_to :country

  def self.toggle(agent, country)
    favourite_country = where(:agent => agent, :country => country)
    if favourite_country.any?
      favourite_country.destroy_all
      return false
    else
      create(:agent => agent, :country => country)
      return true
    end
  end

end
