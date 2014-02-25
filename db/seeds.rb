# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


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

def generate_filler_content
  sentences = 
  ["We'll need to have a look inside you with this camera.",
    "I had more, but you go ahead. Good man. Nixon's pro-war and pro-family.",
    "Hey! I'm a porno-dealing monster, what do I care what you think?",
    "Uh, is the puppy mechanical in any way? Come, Comrade Bender!",
    "We must take to the streets!",
    "Goodbye, friends. I never thought I'd die like this. But I always really hoped.",
    "Hey, whatcha watching?",
    "Well I'da done better, but it's plum hard pleading a case while awaiting trial for that there incompetence.",
    "When the lights go out, it's nobody's business what goes on between two consenting adults.",
    "Now that the, uh, garbage ball is in space, Doctor, perhaps you can help me with my sexual inhibitions?",
    "Leela, are you alright? You got wanged on the head.",
    "Fatal. Man, I'm sore all over. I feel like I just went ten rounds with mighty Thor. It's a T. It goes 'tuh'."    
    ]

    filler_text = ""
    (rand(25)+1).times do
      filler_text << sentences.shuffle.first + " "
    end
    return filler_text
end


unless Traveller.any?
  puts "Creating test traveller..."
  Traveller.create(:email => "test@test.com", :password => "welcome1", :password_confirmation => "welcome1")
else
  puts "Traveller already created!"
end

unless Agent.any?
  puts "Creating test agents..."
  25.times do |num|
    Agent.create(:email => "test#{num}@test.com", :password => "welcome1", :password_confirmation => "welcome1", :agent_detail => AgentDetail.create({:name => "Travel Agent #{num}", :address_1 => "#{num} The Street", :town => "Birmingham", :postcode => "B1 1BR", :main_phone => "0121 123 4567", :email => "test#{num}@test.com"}))
  end
else
  puts "Agents already populated!"
end


unless Holiday.any?
  puts "Creating test holidays..."

  number_of_countries = Country.count
  traveller = Traveller.first

  50.times do |num|
    traveller.holidays.create(:country_id => (rand(number_of_countries) + 1), :earliest_date => (Date.current + 1.month), :latest_date => (Date.current + 2.months), :nights => (rand(25) + 1), :budget => (rand(20000)+1), :adults => rand(6)+1, :children => rand(3), :include_travel => (rand(2)==0), :ballpark => (rand(2)==0), :description => generate_filler_content )
  end
else
  puts "Holidays already populated!"
end

unless Pitch.any? 
  puts "Creating test pitches..."

  Holiday.all.each do |hol|
      Agent.all.each do |agent|
        next if rand(2) == 0

        p = hol.pitches.create(:min => rand(3000)+1, :max => rand(8000)+3010, :expertise => ["familiar", "expert", "specialist"].shuffle.first, :content => generate_filler_content, :seen => (rand(2) == 0), :agent_id => agent.id)
    end
  end
else
  puts "Pitches already populated!"
end

puts "Done!"

