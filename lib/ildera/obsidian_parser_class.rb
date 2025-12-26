## First Age
#
#| Date       | Type       | Specific                                               |
#| ---------- | ---------- | ------------------------------------------------------ |
#| 361.1.2.18 | birth      | [[Kunka-33]]-w by unknown of [[Des'Mäŧën]]             |
#| 361.1.2.21 | birth      | [[Amdëlu-31]]-w by unknown of [[Ŧëc]]                  |
#| 370.1.2.13 | birth      | [[Šïäcieš-34]]-w by unknown of [[Adënŕe]]              |
#| 375.2.3.15 | birth      | [[Maŕaj-20]]-w by unknown of [[Des'Mŭŕ]]               |

class ObsidianParser
  class ObsidianFile
    def initialize
      @sections = {}
    end
    
    def insert(number, name, text, tables)
      @sections[number] = {}
      @sections[number][:name] = name
      @sections[number][:text] = text if text != ""
      @sections[number][:tables] = tables
    end

    def get
      @sections
    end
  end

  def initialize(file)
    @ofile = ObsidianFile.new()
    @sectionno = 0
    @heading = "filename"
    @text = ""
    @tables = {}

    @tableno = 0
    @table = {}
    @tablerow = 0
    @is_table = false

    File.foreach(file) do |line|
      case line[0]
      when ""
        continue
      when "#" 
        end_table if @is_table
        parse_heading(line)
      when "|"
        parse_table(line)
      else
        end_table if @is_table
        parse_text(line)
      end
    end

    end_table if @is_table
    end_heading
    @ofile
  end

  def parse_text(line)
    @text << line
  end

  def parse_table(line)
    @is_table = true
    @table[@tablerow] = line.split("|").map {|cell| cell.strip}.select { |cell| !cell.empty?}
    @tablerow += 1
  end

  def end_table
    @tables[@tableno] = @table
    @tableno += 1
    @is_table = false
    @table = {}
  end

  def parse_heading(line)
    end_heading
    line.each_char do |c|
      @heading << c if c != "#"
    end
    @heading = @heading.strip
  end

  def end_heading
    @ofile.insert(@sectionno, @heading, @text, @tables)
    @sectionno += 1
    @heading = ""
    @tables = {}
    @table = {}
  end

  def get
    @ofile.get
  end
end