require_relative 'bike.rb'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available in dock' if @bikes.empty?

    @bikes.sample
  end

  def dock(bike)
    raise 'Docking station is full' unless @bikes.empty?

    @bikes.push(bike)
  end
end
