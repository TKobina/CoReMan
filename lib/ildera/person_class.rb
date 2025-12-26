require "ildera/idate_class"
class Person
  def initialize(name:, pid:, gender: "w", house: "unhoused", birthdate:'')
    @name = name
    @pid = pid
    @gender = gender
    @house = house
    @birthdate = birthdate
    
    @relations = []     

    @title = ""
  end

  def name? = @name
  def pid? = @pid
  def gender? = @gender
  def birthdate? = @birthdate
  def deathdate? = @deathdate
  def relations? = @relations
  def title? = {title: @title, titledate: @titledate}
  

  def set(name:'', deathdate:'', title:'', titledate:'')
    @name = name if name.present?
    @deathdate = deathdate if deathdate.present?
    @title = title if title.present?
    @titledate = titledate if titledate.present?
  end

  def add_relation(relation)
    puts relation
    @relations.append(relation)
  end

  def to_s
    str = @name << "(" << @pid.to_s << ")"
    str << ", " << @title if @title != ""

    str << " of House " << @house << "\n\t" << 
    "born: " << @birthdate.to_s << "\n\t" << 
    "died: " << @deathdate.to_s 

    if !@relations.empty?
      str << "\n\trelations:" << "\n\t"
      @relations.each do |r|
        str << r[1] << ": " << r[0][0] << "(" << r[0][1] << ")\n\t"
      end
    end
    str
  end
end