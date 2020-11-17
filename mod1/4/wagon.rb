require_relative 'modules'

class Wagon
  include Manufacturer

  attr_reader :type

  def initialize(tp)
    @type = tp
  end
end
