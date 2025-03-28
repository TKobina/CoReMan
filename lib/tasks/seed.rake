require "faker_seeder/seeder_class"
require "faker_seeder/faker_helper_class"

namespace :db do
  desc "Seeds the database with initial Users, etc."
  task seed_init: :environment do
    base_seeding = Rails.application.credentials.mock_seeding
    memail =base_seeding[:email_base] + base_seeding[:email_suffix]

    unless User.find_by(email_address: memail).present?
      User.create!(email_address: memail, password: base_seeding[:password])
    end

    EntityType.where(value: "Person").first_or_create
    EntityType.where(value: "Organization").first_or_create
    EntityType.where(value: "Event").first_or_create

    EntityNameType.where(value: "Legal Name").first_or_create
    EntityNameType.where(value: "Nickname").first_or_create
    EntityNameType.where(value: "Scene Name").first_or_create
  end


  desc "Seeds mock data into database"
  task seed_mock: :environment do
    seeder = SeederClass.new()
    seeder.seed_users(4)
    seeder.seed_entities(6)
    seeder.seed_events(6)
  end

  desc "Unseed mock data from database"
  task unseed_mock: :environment do
    seeder = SeederClass.new()
    seeder.unseed()
  end
end
