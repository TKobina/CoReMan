require 'faker_seeder/seeder_class'
require 'faker_seeder/faker_helper_class'

namespace :db do

  desc "Seeds mock data into database"
  task seed_mock: :environment do
    seeder = SeederClass.new()
    seeder.seed_users(4)
    #seeder.seed_entities(10)
    #seeder.seed_events(6)
  end

  desc "Unseed mock data from database"
  task unseed_mock: :environment do
    seeder = SeederClass.new()
    seeder.unseed()
  end
end