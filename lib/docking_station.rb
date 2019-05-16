require_relative 'bike.rb'

# A docking station to store bikes in, woohoo!
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
    raise 'Docking station is full' if @bikes.full?

    @bikes << bike
  end

  private

  def full?
    @bikes.count >= 20
  end
end
