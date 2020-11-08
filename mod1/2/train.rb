class Train
  # public 'cause we need to read and change them
  attr_accessor :wagons, :speed
  # public 'cause we need to read them
  attr_reader :id, :route, :type

  def initialize(id)
    @id = id
    @wagons = []
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

  def previous_station
    route.stations[curr_station_index - 1] if curr_station_index != 0
  end

  def curr_station
    route.stations[curr_station_index]
  end

  def next_station
    route.stations[curr_station_index + 1] if curr_station_index != route.stations.size - 1
  end

  private

  # private because these fields are not changing during lifetime of class
  attr_writer :id, :route, :type
end
