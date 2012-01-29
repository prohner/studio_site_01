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
    studio  = Studio.create!( :name => "Studio of " + Faker::Name.name)
    country = Country.create!(:name => "Country: " + Faker::Name.name)
    style   = Style.create!(:name => "Style " + Faker::Name.name,
                            :country => country,
                            :studio => studio)
    
  end
end
