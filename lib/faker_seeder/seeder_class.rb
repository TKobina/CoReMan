class SeederClass
  def initialize
    @faker_helper = FakerInterfaceClass.new()
    @logger = Logger.new("log/coreman/seeder.rake.log")
  end

  def unseed
    mock_users = get_mock_users.compact
    mock_users.each do |email|
      user = User.where(email_address: email)
      user.first.destroy unless user.empty?
    end
    write_mock_users([])
  end


  def seed_users(n)
    mock_settings = Rails.application.credentials.mock_seeding

    email_base = mock_settings[:email_base]
    email_suffix = mock_settings[:email_suffix]
    mock_password = mock_settings[:password]

    mock_user_emails = []

    begin
      n.times do
        email_address = email_base + "+" + Faker::Name.first_name + Time.now.to_i.to_s + email_suffix
        mock_user_emails << User.create!(
          password: mock_password,
          email_address: email_address
        ).email_address
      end
    rescue
      puts "SeederClass::seed_users broke, for some reason"
    end

    append_mock_users(mock_user_emails)
  end

  def seed_user(n, email, entity_type_value)
    entity_type = EntityType.where(value: entity_type_value).first.id
    n.times do
      e = Entity.new(
        user_id: User.where(email_address: email).first.id,
        display_name:  @faker_helper.gen_entity_person_name,
        description: @faker_helper.gen_entity_person_description,
        entity_type_id: entity_type)
      e.save
    end
  end

  def seed_entity_persons(n)
    users = get_mock_users
    users.each do |email|
      seed_user(n, email, "Person")
    end
  end

  def seed_entity_events(n)
    users = get_mock_users
    users.each do |email|
      seed_user(n, email, "Event")
    end
  end

  private

  def append_mock_users(mock_users)
    extant_emails = get_mock_users
    write_mock_users((mock_users + extant_emails).uniq)
  end

  def write_mock_users(mock_users)
    titled_emails = { title: "mock_user_emails", user_emails: mock_users }
    File.open("#{Rails.root}/db/mock_seeds/mock_data.yml", "w") { |file| file.write(titled_emails.to_yaml) }
  end

  def get_mock_users
    YAML.load_file("#{Rails.root}/db/mock_seeds/mock_data.yml")[:user_emails]
  end
end
