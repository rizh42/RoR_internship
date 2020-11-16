require_relative 'train'

class CargoTrain < Train
  def initialize(id)
    super
    @type = 'cargo'
  end
end
