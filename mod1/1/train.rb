class Train
  attr_accessor :number, :vans_count, :speed, :route, :type
  attr_writer :curr_station_index

  def initialize(num, tp, count)
    @number = num
    @type = tp
    @vans_count = count
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def new_route(rt)
    @route = rt
    route.stations.first.add_train(self)
    @curr_station_index = 0
  end

  def accelerate(sp)
    self.speed += sp
  end

  def move_forward
    return if curr_station == route.stations.size - 1
    route.stations[curr_station_index].del_train(self)
    self.curr_station_index += 1
    route.stations[curr_station_index].add_train(self)
  end

  def move_back
    return if curr_station_index != 0
    route.stations[curr_station_index].del_train(self)
    self.curr_station_index -= 1
    route.stations[curr_station_index].add_train(self)
  end

  def add_van
    if speed.zero?
      self.vans_count += 1
    else
      puts "Train's speed should be 0"
    end
  end

  def remove_van
    if speed.zero?
      self.vans_count -= 1
    else
      puts "Train's speed should be 0"
    end
  end

  def previous_station
    route.stations[curr_station_index - 1] if curr_station_index != 0
  end

  def curr_station_index
    route.stations[curr_station_index]
  end

  def next_station
    route.stations[curr_station_index + 1] if curr_station_index != route.stations.size - 1
  end
end
