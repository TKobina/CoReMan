class FakerHelperClass
  def generate_event_name
    case rand(11)
    when 0
      Faker::Creature::Dog.meme_phrase
    when 1
      Faker::App.name + " " + Faker::App.semantic_version
    when 2
      Faker::BossaNova.song
    when 3
      Faker::Coffee.blend_name
    when 4
      Faker::Commerce.department + " at " + Faker::Commerce.vendor
    when 5
      Faker::DcComics.title
    when 6
      Faker::Demographic.educational_attainment + " at " + Faker::Educator.university
    when 7
      Faker::Esport.game + " at " + Faker::Esport.event
    when 8
      Faker::Hobby.activity + " " + Faker::Food.ethnic_category
    when 9
      Faker::Job.field + " " + Faker::Science.science + " with " + Faker::Science.tool
    when 10
      Faker::Marketing.buzzwords
    when 11
      Faker::Verb.base 
    end
  end

  def generate_event_text
    case rand(8)
    when 0
      Faker::ChuckNorris.fact
    when 1
      Faker::Coffee.notes
    when 2
      Faker::Company.catch_phrase
    when 3
      Faker::Hipster.paragraph
    when 4
      Faker::Restaurant.description 
    when 5
      Faker::Restaurant.review 
    when 6..8
      Faker::String.random(length: 12..30)
    end
  end

  def generate_entity_name
    case rand(24)
    when 0
       Faker::Books::Dune.character
    when 1
       Faker::Books::Dune.title + " " + Faker::Books::Dune.character
    when 2
       Faker::Books::Dune.character + " of " + Faker::Books::Dune.planet
    when 3
       Faker::Books::Dune.character + " of " + Faker::Books::Dune.city
    when 4
       Faker::Books::Dune.title + " " + Faker::Books::Dune.character + " of " + Faker::Books::Dune.planet
    when 5
       Faker::Books::Dune.title + " " + Faker::Books::Dune.character + " of " + Faker::Books::Dune.city
    when 6
       Faker::Books::Lovecraft.deity + " of " + Faker::Books::Lovecraft.location
    when 7
       Faker::Books::Lovecraft.deity + " of " + Faker::Books::CultureSeries.planet
    when 8
       Faker::Books::Lovecraft.word + " " + Faker::Books::Lovecraft.deity + " of " + Faker::Books::Lovecraft.location
    when 9
       Faker::Books::Lovecraft.word + " " + Faker::Books::Lovecraft.deity + " of " + Faker::Books::CultureSeries.planet
    when 10
       Faker::Books::TheKingkillerChronicle.character + " of " + Faker::Books::TheKingkillerChronicle.location
    when 11
       Faker::Books::TheKingkillerChronicle.character + " " + Faker::Books::TheKingkillerChronicle.creature
    when 12
       Faker::Fantasy::Tolkien.character
    when 13
       Faker::Games::WarhammerFantasy.hero
    when 14
       Faker::Games::Myst.character
    when 15
       Faker::Games::DnD.name
    when 16
       Faker::Games::DnD.first_name + " of " + Faker::Games::DnD.city
    when 17
       Faker::Games::ElderScrolls.name
    when 18
       Faker::Games::ElderScrolls.first_name + " of " + Faker::Games::ElderScrolls.region
    when 19
       Faker::Games::FinalFantasyXIV.character
    when 20
       Faker::Games::Witcher.character
    when 21
       Faker::Movies::HitchhikersGuideToTheGalaxy.character
    when 22
       Faker::Movies::HitchhikersGuideToTheGalaxy.character + " of " + Faker::Movies::HitchhikersGuideToTheGalaxy.planet
    when 23
      Faker::Book.author
    when 24
      Faker::Drone.name 
    end
  end

  def generate_entity_text
    case rand(23)
    when 0
      Faker::Games::WarhammerFantasy.quote
    when 1
      Faker::Books::Dune.quote
    when 2
      Faker::Books::Dune.saying
    when 3
      Faker::Books::Lovecraft.sentence
    when 4
      Faker::Fantasy::Tolkien.poem
    when 5
      Faker::Games::WarhammerFantasy.quote
    when 6
      Faker::Games::Myst.quote
    when 7
      Faker::Games::Witcher.quote
    when 8
      Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote
    when 9
      Faker::Movies::HitchhikersGuideToTheGalaxy.quote
    when 10
      Faker::Quotes::Chiquito.expression
    when 11
      Faker::Quotes::Chiquito.sentence
    when 12
      Faker::Quote.famous_last_words
    when 13
      Faker::Quote.jack_handey
    when 14
      Faker::Quote.matz
    when 15
      Faker::Quote.most_interesting_man_in_the_world
    when 16
      Faker::Quote.robin
    when 17
      Faker::Quotes::Rajnikanth.joke
    when 18
      Faker::Quotes::Shakespeare.hamlet_quote
    when 19
      Faker::Quotes::Shakespeare.as_you_like_it_quote
    when 20
      Faker::Quotes::Shakespeare.king_richard_iii_quote
    when 21
      Faker::Quotes::Shakespeare.romeo_and_juliet_quote
    when 22
      Faker::GreekPhilosophers.quote
    when 23
      Faker::Hacker.say_something_smart
    end
  end
end