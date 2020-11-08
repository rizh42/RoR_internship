require_relative 'route'
require_relative 'train'
require_relative 'station'
require_relative 'wagon'

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
     'l) Get list of trains on station'

puts 'Enter command:'

stations = {}
routes = {}
trains = {}

command = gets.chomp!

until command == ''
  case command
  when '0'
    stations.each { |item| item }
    routes.each { |item| item }
    trains.each { |item| item }
  when 'a'
    puts "Enter station's name:"
    tmp = gets.chomp!
    station = Station.new(tmp)
    stations[tmp] = station
  when 'b'
    puts "Enter train's id and type"
    tmp = gets.chomp!.split(' ')
    trains[tmp[0]] = if tmp[1] == 'cargo'
                       CargoTrain.new(tmp[0], 'cargo')
                     else
                       PassTrain.new(tmp[0], 'pass')
                     end
  when 'c'
    if stations.size > 2
      puts "Enter route's name:"
      route_name = gets.chomp!
      puts "Enter first and second stations' name"
      tmp = gets.chomp!.split(' ')
      routes[route_name] = Route.new(stations[tmp[0]], stations[tmp[1]])
    else
      puts 'Not enough stations'
    end
  when 'd'
    puts "Enter route's and station's name:"
    tmp = gets.chomp!.split(' ')
    routes[tmp[0]].add_station(stations[tmp[1]])
  when 'e'
    puts "Enter route's and station's name:"
    tmp = gets.chomp!.split(' ')
    routes[tmp[0]].delete_station(stations[tmp[1]])
  when 'f'
    puts "Enter train's id and route's name:"
    tmp = gets.chomp!.split(' ')
    trains[tmp[0]].new_route(routes[tmp[1]])
  when 'g'
    puts "Enter wagon's type and train's id"
    tmp = gets.chomp!.split(' ')
    trains[tmp[1]].add_wagon(Wagon.new(tmp[0]))
  when 'h'
    puts "Enter train's id"
    tmp = gets.chomp!
    trains[tmp].remove_wagon
  when 'i'
    puts "Enter train's id"
    tmp = gets.chomp!
    trains[tmp].move_forward
  when 'j'
    puts "Enter train's id"
    tmp = gets.chomp!
    trains[tmp].move_back
  when 'k'
    puts "Enter route's name"
    tmp = gets.chomp!
    routes[tmp].route_stations
  when 'l'
    puts "Enter station's name"
    tmp = gets.chomp!
    stations[tmp].trains
  when '42'
    puts 'Right answer'
  else
    puts 'Wrong cmd!'
  end

  command = gets.chomp!
end
