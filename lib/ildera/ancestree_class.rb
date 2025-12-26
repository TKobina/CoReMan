require "yaml"
require "set"
require "ildera/person_class"
require "ildera/obsidian_parser_class"

class Ancestree
  def initialize
    @population = {}
    @houses = {}
    
    @config = YAML.load_file(File.join(__dir__, 'config', 'settings.yml'))
    
    @config["houses"].each { |house| @houses[house] = Set.new}
    
    chronology_file = __dir__ << @config["obsidian_dir"] << @config["chronology"]
    chronology = select_tables(ObsidianParser.new(chronology_file).get)[0][1]
    parse_chronology(chronology)
  end

  def select_tables(chronology)
    tables = []
    chronology.each do |key, value|
      if !value[:tables].nil?
        value[:tables].each {|table| tables.append(table)}
      end
    end
    tables
  end

  def parse_chronology(chronology)
    chronology.each do |line, event|
      date, event_type, details = event
      @date = IDate.new(date: date)
      case event_type
      when "birth"
        parse_birth(date, details)
      when "marriage"
      when "raise"
      when "death"
      when "consortion"
      when "adoption"
      when "exile"
      else
      end
    end
  end

  def parse_birth(date, details)
    details = details.split
    cname, cid, cgender = parse_id(details[0]).values_at(:name, :id, :gender)

    pname, pid = parse_id(details[2]).values_at(:name, :id)

    house = details[4].delete("[]")

    child = Person.new(name: cname, pid: cid, gender: cgender, house: house, birthdate: date)

    @population[[cname, cid]] = child
    @houses[house].add([[cname, cid]])
  end

  def parse_id(id)
    name, id, gender = id.split("-").map {|str| str.delete("[]")}
    {name: name, id: id, gender: gender}
  end
  
  def to_s
    str = ""
    @population.each do |key, value|
      str << value.to_s << "\n"
    end

    str
  end
end