require_relative "filler"

class TestDataGenerator < Rails::Generators::Base

  puts "COUNTRIES NOT IMPORTED. ABORTING" and exit unless Country.any?

  filler = Filler.new

unless Traveller.any?
  puts "Creating test traveller..."
  Traveller.create(:email => "test@test.com", :password => "welcome1", :password_confirmation => "welcome1")
else
  puts "Traveller already created!"
end

unless Agent.any?
  puts "Creating test agents..."
  5.times do |num|
    Agent.create(:email => "test#{num}@test.com", :password => "welcome1", :password_confirmation => "welcome1", :agent_detail => AgentDetail.create({:name => "Travel Agent #{num}", :address_1 => "#{num} The Street", :town => "Birmingham", :postcode => "B1 1BR", :main_phone => "0121 123 4567", :email => "test#{num}@test.com"}))
  end
else
  puts "Agents already populated!"
end


unless Holiday.any?
  puts "Creating test holidays..."

  number_of_countries = Country.count
  traveller = Traveller.first

  10.times do |num|
    traveller.holidays.create(:country_id => (rand(number_of_countries) + 1), :earliest_date => (Date.current + 1.month), :latest_date => (Date.current + 2.months), :nights => (rand(25) + 1), :budget => (rand(20000)+1), :adults => rand(6)+1, :children => rand(3), :include_travel => (rand(2)==0), :description => filler.generate_content )
  end
else
  puts "Holidays already populated!"
end

unless Pitch.any? 
  puts "Creating test pitches..."

  Holiday.all.each do |hol|
      Agent.all.each do |agent|
        next if rand(2) == 0

        p = hol.pitches.create(:min => rand(3000)+1, :max => rand(8000)+3010, :expertise => ["familiar", "expert", "specialist"].shuffle.first, :content => filler.generate_content, :seen => (rand(2) == 0), :agent_id => agent.id)
    end
  end
else
  puts "Pitches already populated!"
end

puts "Done!"
#source_root File.expand_path('../templates', __FILE__)
end
