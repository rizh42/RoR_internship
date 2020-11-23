require_relative 'train'

class PassengerTrain < Train
  def initialize(id)
    super(id)
    @type = 'pass'
  end
end
