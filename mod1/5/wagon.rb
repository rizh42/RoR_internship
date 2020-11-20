require_relative 'modules'

class Wagon
  include Manufacturer
  attr_accessor :volume, :free_volume
  attr_reader :type

  def initialize(tp, number, volume)
    @type = tp
    @number = number
    @volume = 0
    @free_volume = volume
  end

  def occupy(input_volume)
    self.volume = input_volume
    self.free_volume -= input_volume
  end
end
