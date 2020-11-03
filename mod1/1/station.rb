class Station
  attr_accessor :name, :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train
  end

  def get_all_trains
    trains.each_index{ |item| puts "Train №#{item + 1}: #{trains[item].number}" }
  end

  def get_pass_trains
    puts "Passenger trains:"
    trains.each{ |item|
      if item.type == "pass"
        puts "#{item.name}"
      end
    }
  end

  def get_freight_trains
    puts "Freight train:"
    trains.each{ |item|
      if item.type == "freight"
        puts "#{item.name}"
      end
    }
  end

  def del_train(train)
    trains.delete(train)
  end
end