class Route
  attr_accessor :stations
  
  def initialize(first_st, last_st)
    @stations = [first_st, last_st]
  end
  
  def add_station(station)
    stations.insert(-2, station)
  end
  
  def get_route
    stations.each{ |item|
      puts "#{item.name}"
    }
  end
  
  def del_station(name)
    stations.delete(name)
  end
end