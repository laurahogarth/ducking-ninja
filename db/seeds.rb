puts "==============================================="
puts "Running DB Seeds for #{Rails.env} environment"
puts "==============================================="

unless Country.any? 
  #Read in yaml file
  puts "Importing Country File..."
  YAML::load_file('lib/countries.yml')["countries"].each do |country_kvp|
    country = country_kvp.last
    Country.create(:name => country["name"], :iso_2 => country["iso_2"])
  end
else
  puts "Countries already populated!" 
end

puts "Done!" and exit unless Rails.env.development?
