require_relative 'modules'

class Station
  include InstanceCounter

  attr_accessor :trains
  attr_reader :name

  @@stations = {}

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations[name] = self
    register_instance
  end

  def add_train(train)
    trains << train
  end

  def pass_train
    trains.filter { |train| train.type == 'pass' }
  end

  def cargo_train
    trains.filter { |train| train.type == 'cargo' }
  end

  def del_train(train)
    trains.delete(train)
  end

  def to_block
    trains.each do |train|
      yield(train) if block_given?
    end
  end
end
