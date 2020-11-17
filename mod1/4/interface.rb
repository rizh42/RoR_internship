require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'train'
require_relative 'station'
require_relative 'wagon'

class Interface
  def initialize
    puts "Available comands:\n " \
         "0) Get all current data\n " \
         "a) Add station\n " \
         "b) Add train\n " \
         "c) Add route\n " \
         "d) Add station to existing route\n " \
         "e) Delete station from exisiting route\n " \
         "f) Assign the route of the train\n " \
         "g) Add wagon to train\n " \
         "h) Delete wagon from train\n " \
         "i) Move train forward\n " \
         "j) Move train back\n " \
         "k) Get list of stations on route\n " \
         "l) Get list of trains on station\n " \
         "ENTER) Quit\n" \
         'Enter command:'

    @stations = {}
    @routes = {}
    @trains = {}
  end

  def new_session
    command = gets.chomp!

    until command == ''
      case command
      when '0'
        stations.each { |item| puts item }
        routes.each { |item| puts item }
        trains.each { |item| puts item }
      when 'a'
        create_station
      when 'b'
        create_train
      when 'c'
        create_route
      when 'd'
        add_station_to_route
      when 'e'
        delete_station_from_route
      when 'f'
        add_route_to_train
      when 'g'
        add_wagon_to_train
      when 'h'
        remove_wagon_from_train
      when 'i'
        move_train_forward
      when 'j'
        move_train_back
      when 'k'
        stations_at_route
      when 'l'
        trains_at_station
      when '42'
        puts 'Right answer'
      else
        puts 'Wrong cmd!'
      end

      puts 'Enter command:'

      command = gets.chomp!
    end
  end

  private

  # All these methods are private because nobody should see how they work

  attr_accessor :stations, :routes, :trains

  def create_station
    puts "Enter station's name:"
    tmp = gets.chomp!
    station = Station.new(tmp)
    stations[tmp] = station
  end

  def create_train
    puts "Enter train's id and type:"
    tmp = gets.chomp!.split(' ')
    trains[tmp[0]] = if tmp[1] == 'cargo'
                       CargoTrain.new(tmp[0])
                     else
                       PassengerTrain.new(tmp[0])
                     end
    puts "New train has been created:\n  #{trains[tmp[0]]}"
  rescue RuntimeError => e
    if e.message == 'error_id'
      puts 'Wrong ID format!'
    else
      puts 'ID cannot be nil!'
    end
    retry
  end

  def create_route
    if stations.size > 2
      puts "Enter route's name:"
      route_name = gets.chomp!
      puts "Enter first and second stations' name"
      tmp = gets.chomp!.split(' ')
      routes[route_name] = Route.new(stations[tmp[0]], stations[tmp[1]])
    else
      puts 'Not enough stations'
    end
  end

  def add_station_to_route
    puts "Enter route's and station's name:"
    tmp = gets.chomp!.split(' ')
    routes[tmp[0]].add_station(stations[tmp[1]])
  end

  def delete_station_from_route
    puts "Enter route's and station's name:"
    tmp = gets.chomp!.split(' ')
    routes[tmp[0]].delete_station(stations[tmp[1]])
  end

  def add_route_to_train
    puts "Enter train's id and route's name:"
    tmp = gets.chomp!.split(' ')
    trains[tmp[0]].new_route(routes[tmp[1]])
  end

  def add_wagon_to_train
    puts "Enter wagon's type and train's id"
    tmp = gets.chomp!.split(' ')
    trains[tmp[1]].add_wagon(Wagon.new(tmp[0]))
  end

  def remove_wagon_from_train
    puts "Enter train's id"
    tmp = gets.chomp!
    trains[tmp].remove_wagon
  end

  def move_train_forward
    puts "Enter train's id"
    tmp = gets.chomp!
    trains[tmp].move_forward
  end

  def move_train_back
    puts "Enter train's id"
    tmp = gets.chomp!
    trains[tmp].move_back
  end

  def stations_at_route
    puts "Enter route's name"
    tmp = gets.chomp!
    routes[tmp].route_stations
  end

  def trains_at_station
    puts "Enter station's name"
    tmp = gets.chomp!
    stations[tmp].trains
  end
end
