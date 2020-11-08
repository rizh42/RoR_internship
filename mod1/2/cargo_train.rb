class CargoTrain < Train
  def add_wagon(wagon)
    if speed.zero? && wagon.type == 'cargo'
      curr_station_index += 1
      wagons << wagon
    else
      puts "Train's speed should be 0 or wagon's type is incorrect"
    end
  end

  def remove_wagon
    curr_station_index -= 1
    wagons.delete(wagons.last) if speed.zero?
  end
end
