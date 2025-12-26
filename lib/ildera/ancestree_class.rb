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

    unk = Person.new(name: "unknown", pid: "0")
    @population[["unknown","0"]] = unk
    @houses["unhoused"].add(["unknown","0"])
    
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

    add_relation([pname, pid],[cname, cid], "šnarë", date)
  end

  def add_relation(pid1, pid2, relation_type, date)
    p1 = @population[pid1]
    case relation_type
    when "šnarë"
      relation_type = rtype_snare(p1.gender?)
    when "consortion"
      add_hlo(pid1, pid2)
    end
    p1.add_relation([pid2, relation_type, date])
  end

  def rtype_snare(gender)
    case gender
    when "w"
      relation_type = "šnaïrë"
    when "n"
      relation_type = "šnayïrë"
    when "m"
      relation_type = "šnayyïrë"
    end
  end

def add_hlo(pid1, pid2)
  case p2.gender?
  when "w"
    relation_type = "hlöï"
  when "n"
    relation_type = "hlöyï"
  when "m"
    relation_type = "hlöyyï"
  end
end

  def parse_id(id)
    name, id, gender = id.split("-").map {|str| str.delete("[]")}
    id = "0" if name == "unknown"
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