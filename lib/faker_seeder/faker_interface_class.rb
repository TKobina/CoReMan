class FakerInterfaceClass
  def initialize
    @entity_person_names = []
    @entity_person_descriptions = []

    @entity_event_names = []
    @entity_event_descriptions = []

    populate_entity_person_names
    populate_entity_person_descriptions
    populate_entity_event_names
    populate_entity_event_descriptions
  end

  def gen_entity_person_name
   @entity_person_names.sample.call
  end

  def gen_entity_person_description
    @entity_person_descriptions.sample.call
  end

  def gen_entity_event_name
    @entity_event_names.sample.call
  end

  def gen_entity_event_description
    @entity_event_descriptions.sample.call
  end


  def populate_entity_person_names
    @entity_person_names <<
      Proc.new { Faker::Books::Dune.character } <<
      Proc.new { Faker::Books::Dune.title + " " + Faker::Books::Dune.character } <<
      Proc.new { Faker::Books::Dune.character + " of " + Faker::Books::Dune.planet } <<
      Proc.new { Faker::Books::Dune.character + " of " + Faker::Books::Dune.city } <<
      Proc.new { Faker::Books::Dune.title + " " + Faker::Books::Dune.character + " of " + Faker::Books::Dune.planet } <<
      Proc.new { Faker::Books::Dune.title + " " + Faker::Books::Dune.character + " of " + Faker::Books::Dune.city } <<
      Proc.new { Faker::Books::Lovecraft.deity + " of " + Faker::Books::Lovecraft.location } <<
      Proc.new { Faker::Books::Lovecraft.deity + " of " + Faker::Books::CultureSeries.planet } <<
      Proc.new { Faker::Books::Lovecraft.word + " " + Faker::Books::Lovecraft.deity + " of " + Faker::Books::Lovecraft.location } <<
      Proc.new { Faker::Books::Lovecraft.word + " " + Faker::Books::Lovecraft.deity + " of " + Faker::Books::CultureSeries.planet } <<
      Proc.new { Faker::Books::TheKingkillerChronicle.character + " of " + Faker::Books::TheKingkillerChronicle.location } <<
      Proc.new { Faker::Books::TheKingkillerChronicle.character + " " + Faker::Books::TheKingkillerChronicle.creature } <<
      Proc.new { Faker::Fantasy::Tolkien.character } <<
      Proc.new { Faker::Games::WarhammerFantasy.hero } <<
      Proc.new { Faker::Games::Myst.character } <<
      Proc.new { Faker::Games::DnD.name } <<
      Proc.new { Faker::Games::DnD.first_name + " of " + Faker::Games::DnD.city } <<
      Proc.new { Faker::Games::ElderScrolls.name } <<
      Proc.new { Faker::Games::ElderScrolls.first_name + " of " + Faker::Games::ElderScrolls.region } <<
      Proc.new { Faker::Games::FinalFantasyXIV.character } <<
      Proc.new { Faker::Games::Witcher.character } <<
      Proc.new { Faker::Movies::HitchhikersGuideToTheGalaxy.character } <<
      Proc.new { Faker::Movies::HitchhikersGuideToTheGalaxy.character + " of " + Faker::Movies::HitchhikersGuideToTheGalaxy.planet } <<
      Proc.new { Faker::Book.author } <<
      Proc.new { Faker::Drone.name }
  end

  def populate_entity_person_descriptions
    @entity_person_descriptions <<
      Proc.new { Faker::Games::WarhammerFantasy.quote } <<
      Proc.new { Faker::Books::Dune.quote } <<
      Proc.new { Faker::Books::Dune.saying } <<
      Proc.new { Faker::Books::Lovecraft.sentence } <<
      Proc.new { Faker::Fantasy::Tolkien.poem } <<
      Proc.new { Faker::Games::WarhammerFantasy.quote } <<
      Proc.new { Faker::Games::Myst.quote } <<
      Proc.new { Faker::Games::Witcher.quote } <<
      Proc.new { Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote } <<
      Proc.new { Faker::Movies::HitchhikersGuideToTheGalaxy.quote } <<
      Proc.new { Faker::Quotes::Chiquito.expression } <<
      Proc.new { Faker::Quotes::Chiquito.sentence } <<
      Proc.new { Faker::Quote.famous_last_words } <<
      Proc.new { Faker::Quote.jack_handey } <<
      Proc.new { Faker::Quote.matz } <<
      Proc.new { Faker::Quote.most_interesting_man_in_the_world } <<
      Proc.new { Faker::Quote.robin } <<
      Proc.new { Faker::Quotes::Rajnikanth.joke } <<
      Proc.new { Faker::Quotes::Shakespeare.hamlet_quote } <<
      Proc.new { Faker::Quotes::Shakespeare.as_you_like_it_quote } <<
      Proc.new { Faker::Quotes::Shakespeare.king_richard_iii_quote } <<
      Proc.new { Faker::Quotes::Shakespeare.romeo_and_juliet_quote } <<
      Proc.new { Faker::GreekPhilosophers.quote } <<
      Proc.new { Faker::Hacker.say_something_smart }
  end

  def populate_entity_event_names
    @entity_event_names <<
      Proc.new { Faker::Creature::Dog.meme_phrase } <<
      Proc.new { Faker::App.name + " " + Faker::App.semantic_version } <<
      Proc.new { Faker::BossaNova.song } <<
      Proc.new { Faker::Coffee.blend_name } <<
      Proc.new { Faker::Commerce.department + " at " + Faker::Commerce.vendor } <<
      Proc.new { Faker::DcComics.title } <<
      Proc.new { Faker::Demographic.educational_attainment + " at " + Faker::Educator.university } <<
      Proc.new { Faker::Esport.game + " at " + Faker::Esport.event } <<
      Proc.new { Faker::Hobby.activity + " " + Faker::Food.ethnic_category } <<
      Proc.new { Faker::Job.field + " " + Faker::Science.science + " with " + Faker::Science.tool } <<
      Proc.new { Faker::Marketing.buzzwords } <<
      Proc.new { Faker::Verb.base }
  end

  def populate_entity_event_descriptions
    @entity_event_descriptions <<
      Proc.new { Faker::ChuckNorris.fact } <<
      Proc.new { Faker::Coffee.notes } <<
      Proc.new { Faker::Company.catch_phrase } <<
      Proc.new { Faker::Hipster.paragraph } <<
      Proc.new { Faker::Restaurant.description } <<
      Proc.new { Faker::Restaurant.review }
  end
end
