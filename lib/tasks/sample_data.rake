require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_studios
  end
end

def make_studios
  5.times do |n|
    studio  = Studio.create!( :name => Faker::Company.name)
    studio.address = Faker::Address.street_address
    studio.city = Faker::Address.city
    studio.state = Faker::Address.us_state_abbr
    studio.postal_code = Faker::Address.zip_code
    studio.phone = Faker::PhoneNumber.phone_number
    studio.fax = Faker::PhoneNumber.phone_number
    studio.email = Faker::Internet.email
    studio.save!
    
    country = Country.create!(:name => "Country: " + Faker::Name.name)

    rand_with_range(1..8).times do |n2|
      style   = Style.create!(:name => "Style: " + Faker::Name.name,
                              :country => country,
                              :studio => studio)
                              
      terms = Faker::Lorem.words(rand(20))
      terms.each do |term|
        translated  = Faker::Lorem.words().first
        definition  = Faker::Lorem.paragraph
        Term.create!( :name             => term,
                      :translated_term  => translated,
                      :definition       => definition,
                      :style            => style
                      )
        puts "#{studio.name}: #{term}"
                
      end
    end
  end
end

def rand_with_range(values = nil)
  if values.respond_to? :sort_by
    values.sort_by { rand }.first
  else
    rand(values)
  end
end
  