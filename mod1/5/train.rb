require_relative 'modules'

class Train
  include InstanceCounter
  include Manufacturer

  attr_accessor :wagons, :speed
  attr_reader :id, :route, :type

  ID_FORMAT = /[\w\d]{3}-?[\w\d]{0,2}/

  def self.find(id)
    @@trains[id]
  end

  @@trains = {}

  def initialize(id)
    @id = id
    @wagons = []
    @speed = 0
    validate!
    register_instance
    @@trains[id] = self
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

  def remove_wagon
    wagons.delete(wagons.last) if speed.zero?
  end

  def add_wagon(wagon)
    wagons << wagon if speed.zero? && wagon.type == type
  end

  def to_block
    trains.each do |train|
      yield(wagons) if block_given?
    end
  end

  protected

  def validate!
    raise 'nil' if id.nil?
    raise 'error_id' if id !~ ID_FORMAT
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  private

  # private because these fields are not changing during lifetime of class
  attr_writer :id, :route, :type
end
