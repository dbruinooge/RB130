class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def to_s
    format("%02d", @hours) + ':' + format("%02d", @minutes)
  end

  def ==(other)
    [@hours, @minutes] == [other.hours, other.minutes]
  end

  def +(minutes_to_add)
    @minutes += minutes_to_add
    standardize_time
    Clock.new(@hours, @minutes)
  end

  def -(minutes_to_subtract)
    @minutes -= minutes_to_subtract
    standardize_time
    Clock.new(@hours, @minutes)
  end

  protected

  attr_reader :hours, :minutes

  private

  def standardize_time
    @hours += @minutes / MINUTES_PER_HOUR
    @minutes %= MINUTES_PER_HOUR
    @hours %= HOURS_PER_DAY
  end
end
