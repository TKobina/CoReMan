require "ildera/ancestree_class"

task yldr: :environment do
  #d0 = IDate.new(date: "490.1.1.1")
  #ages = [114,81 ,57 ,28 ,78 ,125]
  #ages.each do |age|
  #  p "#{age} | #{IDate.new(year: 490 - age).to_s}"
  #end  
  
  #d1 = IDate.new(year: 455)

  #p1 = Person.new(name: "Testing",pid: 45,birthdate: d1)
  #p1.set(name: "Tëst")
  #p1.set(deathdate: IDate.new(year: 530))
  #puts p1.to_s

  t1 = Ancestree.new()
  puts t1.to_s

  #p0 = Person.new()
  #p0
end