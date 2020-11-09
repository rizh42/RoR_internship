class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    trains << train
  end

  def pass_train
    trains.filter { |train| train.type == 'pass' }
  end

  def cargo_train
    @freight_trains = []
    trains.filter { |train| train.type == 'cargo' }
  end

  def del_train(train)
    trains.delete(train)
  end
end
