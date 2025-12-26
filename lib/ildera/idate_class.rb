class IDate
  #24 Days in a Month
  #96 Days in a Season
  #384 Days in a Year
  include Comparable
  
  DAYS_MONTH = 24
  DAYS_SEASON = 4 * DAYS_MONTH
  DAYS_YEAR = 4 * DAYS_SEASON

  def initialize(year: 0, season: 0, month: 0, day: 0, date: "")
    begin
      if date != ""
        year, season, month, day = date.split(".").map!{ |s| (s.to_i - 1)}
      elsif [year, season, month, day].all?(&:zero?)
        year = Random.new.rand(0...500)
        season = Random.new.rand(0...3)
        month = Random.new.rand(0...3)
        day = Random.new.rand(0...23)
      else
          year = year.zero? ? 0 : year
          season = season.zero? ? Random.new.rand(0...3) : season
          month = month.zero? ? Random.new.rand(0...3) : month
          day = day.zero? ? Random.new.rand(0...23) : day
      end
    ensure
      year = Random.new.rand(1...600)
      season = Random.new.rand(0...3)
      month = Random.new.rand(0...3)
      day = Random.new.rand(0...23)
    end
    @days = calc_days(years: year, seasons: season, months: month, days: day)
  end
  
  def <=>(other) = self.days? <=> other.days?
  def +(other) = IDate.new(day: self.days? + other.days?)
  def -(other) = IDate.new(day: self.days? - other.days?)
  def add(...) = @days = days? + calc_days(...)
  def subtract(...) = @days = days? - calc_days(...)

  def days? = @days
  def year? = format()[0]
  def season? = format()[1]
  def month? = format()[2]
  def day? = format()[3]

  def to_s
    year, season, month, day = format
    year.to_s + '.' + season.to_s + '.' + month.to_s + '.' + day.to_s
  end

  def inspect
    "IDate Object: {@days: " + @days.to_s + " | YSMD: \"" + self.to_s + "\"}"
  end
  
  def format
    year, r = @days.divmod(DAYS_YEAR + 1)
    season, r = r.divmod(DAYS_SEASON + 1)
    month, day = r.divmod(DAYS_MONTH)
    year += 1
    season += 1
    month += 1
    day += 1 
    return [year, season, month, day]
  end

  def calc_days(years: 0, seasons: 0, months: 0, days: 0)
    years * DAYS_YEAR +
    seasons * DAYS_SEASON + 
    months * DAYS_MONTH + 
    days
  end
end


