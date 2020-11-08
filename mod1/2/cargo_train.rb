require_relative 'train'

class CargoTrain < Train
  def initialize(id)
    super
    @type = 'cargo'
  end

  def add_wagon(wagon)
    if speed.zero? && wagon.type == 'cargo'
      wagons << wagon
    else
      puts "Train's speed should be 0 or wagon's type is incorrect"
    end
  end

  def remove_wagon
    wagons.delete(wagons.last) if speed.zero?
  end
end
