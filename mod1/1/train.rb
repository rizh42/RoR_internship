class Train
  attr_accessor :number, :vans_count, :speed
  attr_writer :curr_station, :route, :type
  
  def initialize(num, tp, count)
    @number = num
    @type = tp
    @vans_count = count
    @speed = 0
    @route = nil
  end
  
  def stop
    self.speed = 0
  end
  
  def set_route(rt)
    self.route = rt
    route.stations.first.add_train(self)
    @curr_station = 0
  end
  
  def acc(sp)
    self.speed += sp
  end
  
  def move_forward
    if curr_station != route.stations.size - 1
      route.stations[curr_station].del_train(self)
      self.curr_station += 1
      route.stations[curr_station].add_train(self)
    end
  end

  def move_back
    if curr_station != 0
      route.stations[curr_station].del_train(self)
      self.curr_station -= 1
      route.stations[curr_station].add_train(self)
    end
  end
  
  def add_van
    if speed == 0
      self.vans_count += 1
    else
      puts "Train's speed should be 0"
    end
  end
  
  def remove_van
    if speed == 0
      self.vans_count -= 1
    else
      puts "Train's speed should be 0"
    end
  end

  def previous_station
    if curr_station != 0
      route.stations[curr_station - 1]
    end
  end

  def curr_station
    route.stations[curr_station]
  end

  def next_station
    if curr_station != route.stations.size - 1
      route.stations[curr_station + 1]
    end
  end
end