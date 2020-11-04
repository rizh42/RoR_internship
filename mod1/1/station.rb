class Station
  attr_accessor :trains, :pass_trains, :freight_trains
  attr_reader :name
  
  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train
  end

  def get_pass_trains
    @pass_trains = []
    trains.each do |item|
      if item.type == "pass"
        self.pass_trains << item
      end
    end
  end

  def get_freight_trains
    @freight_trains = []
    trains.each do |item|
      if item.type == "freight"
        self.freight_trains << item
      end
    end
  end

  def del_train(train)
    trains.delete(train)
  end
end