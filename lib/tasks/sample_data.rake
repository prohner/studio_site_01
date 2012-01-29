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
    studio  = Studio.create!( :name => "Studio: " + Faker::Name.name)
    studio.address = rand(99999).to_s + " " + Faker::Name.name + " St."
    studio.city = "Woodland Hills"
    studio.state = "CA"
    studio.postal_code = "91367"
    studio.phone = rand(999).to_s + "-" + rand(999).to_s + "-" + rand(9999).to_s
    studio.fax = rand(999).to_s + "-" + rand(999).to_s + "-" + rand(9999).to_s
    studio.save!
    
    country = Country.create!(:name => "Country: " + Faker::Name.name)
    style   = Style.create!(:name => "Style: " + Faker::Name.name,
                            :country => country,
                            :studio => studio)
    
  end
end
