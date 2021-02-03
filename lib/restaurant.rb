class Restaurant
  attr_reader :opening_time, :name, :dishes, :menu_dish_names

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
    @menu_dish_names = []
  end

  def closing_time(duration_hours)
    # closing_time = opening_time[0, 2].to_i + duration_hours # Note: works for 2-digit hours
    # closing_time.to_s + ':00'
    opening_hour = opening_time.split(":").first.to_i
    closing_time = (opening_hour + duration_hours).to_s + ':00'
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    if opening_time.split(":").first.to_i < 12
      true
    else
      false
    end
  end

  def menu_dish_names
    @dishes.each do |dish|
      @menu_dish_names << dish.upcase
    end
  end

  def announce_closing_time(duration_hours)
    opening_hour = opening_time.split(":").first.to_i
    closing_time = (opening_hour + duration_hours).to_s + ':00'
    if (opening_hour + duration_hours) < 12
      ampm = "AM"
    else
      closing_time = (closing_time.split(":").first.to_i - 12).to_s + ':00'
      ampm = "PM"
    end
    "#{@name} will be closing at #{closing_time}#{ampm}"
  end
end
