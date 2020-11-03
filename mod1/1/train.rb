class Train
  attr_accessor :number, :type, :vans_count, :speed, :route, :curr_station
  
  def initialize(num, tp, count)
    @number = num
    @type = tp
    @vans_count = count
    @speed = 0
    @route = nil
    @curr_station = 0
  end
  
  def stop
    self.speed = 0
  end
  
  def set_route(rt)
    self.route = rt
    route.stations.first.add_train(self)
  end
  
  def acc(sp)
    self.speed += sp
  end
  
  def move(flag)
    if flag == 1
      route.stations[curr_station].del_train(self)
      self.curr_station += 1
      route.stations[curr_station].add_train(self)
    elsif flag == -1 && curr_station != 0
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
  
  def rm_van
    if speed == 0
      self.vans_count -= 1
    else
      puts "Train's speed should be 0"
    end
  end

  def get_previous_st
    route.stations[curr_station - 1]
  end

  def get_curr_st
    route.stations[curr_station]
  end

  def get_next_st
    route.stations[curr_station + 1]
  end
end