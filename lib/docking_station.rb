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
    @bikes.push(bike)
  end
end
