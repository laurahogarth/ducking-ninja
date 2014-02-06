# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless Country.any? 
  #Read in yaml file
  puts "Importing Country File..."
  YAML::load_file('lib/countries.yml')["countries"].each do |country_kvp|
    country = country_kvp.last
    Country.create(:name => country["name"], :iso_2 => country["iso_2"])
  end
  puts "Done!"  
else
  puts "Countries already populated!" 
end

unless Traveller.any?
  puts "Creating test traveller..."
  Traveller.create(:email => "test@test.com", :password => "welcome1", :password_confirmation => "welcome1")
end

unless Agent.any?
  puts "Creating test agent..."
  Agent.create(:email => "test@test.com", :password => "welcome1", :password_confirmation => "welcome1")
end
