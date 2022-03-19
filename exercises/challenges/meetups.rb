class Meetup
  ORDINALS = { 'first' => 1, 'second' => 2, 'third' => 3,
               'fourth' => 4, 'fifth' => 5 }
  DAYS_OF_WEEK = %w(sunday monday tuesday wednesday
                    thursday friday saturday)

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    @date = initial_date(schedule)
    case schedule
    when 'first', 'teenth' then find_first_day(weekday)
    when 'last'            then find_last_day(weekday)
    else
      find_nth_day(weekday, ORDINALS[schedule.downcase])
    end
  end

  private

  def initial_date(schedule)
    case schedule
    when 'last'   then Date.new(@year, @month + 1, 1) - 1
    when 'teenth' then Date.new(@year, @month, 13)
    else               Date.new(@year, @month, 1)
    end
  end

  def find_nth_day(weekday, ordinal)
    count = 0
    loop do
      count += 1 if correct_day_of_week?(weekday)
      return nil if @date.month != @month
      return @date if count == ordinal
      @date += 1
    end
  end

  def find_first_day(weekday)
    loop do
      return @date if correct_day_of_week?(weekday)
      @date += 1
    end
  end

  def find_last_day(weekday)
    loop do
      return @date if correct_day_of_week?(weekday)
      @date -= 1
    end
  end

  def correct_day_of_week?(weekday)
    @date.wday == DAYS_OF_WEEK.index(weekday.downcase)
  end
end
