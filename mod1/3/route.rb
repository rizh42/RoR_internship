require_relative 'modules'

class Route
  include InstanceCounter

  attr_accessor :route_stations

  @instances = 0

  def initialize(first_st, last_st)
    @route_stations = [first_st, last_st]
    register_instance
  end

  def add_station(station)
    route_stations.insert(-2, station)
  end

  def delete_station(name)
    route_stations.delete(name)
  end
end
