class Country < ActiveRecord::Base
  validates_presence_of :name

  has_many :holidays

  #SCOPES
  scope :starting_with, ->(letter) { where("name LIKE ?", "#{letter}%") }

  def flag_image
    "flags/flag-#{iso_2.downcase}.png"
  end
end
