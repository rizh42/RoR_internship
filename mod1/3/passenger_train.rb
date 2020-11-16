require_relative 'train'

class PassengerTrain < Train
  def initialize(id)
    super
    @type = 'pass'
  end
end
