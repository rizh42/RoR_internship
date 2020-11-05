class Station
  attr_accessor :trains, :pass_trains, :freight_trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    trains << train
  end

  def pass_trains
    @pass_trains = []
    trains.each do |item|
      pass_trains << item if item.type == 'pass'
    end
  end

  def freight_trains
    @freight_trains = []
    trains.each do |item|
      freight_trains << item if item.type == 'freight'
    end
  end

  def del_train(train)
    trains.delete(train)
  end
end
