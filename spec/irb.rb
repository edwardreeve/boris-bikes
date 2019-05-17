require './lib/docking_station.rb'
require './lib/bike.rb'
require './lib/van.rb'

ds = DockingStation.new
van = Van.new
bike1 = Bike.new
bike2 = Bike.new
bike3 = Bike.new

ds.dock(bike1)
ds.dock(bike2, true)
ds.dock(bike3)
