class Restaurant
  attr_reader :opening_time, :name, :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(duration_hours)
    closing_time = opening_time[0, 2].to_i + duration_hours # Note: works for 2-digit hours
    closing_time = closing_time.to_s + ':00'
  end

  def add_dish(dish)
    @dishes << dish
  end
end
