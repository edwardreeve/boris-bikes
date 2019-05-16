require_relative 'bike.rb'

# A docking station to store bikes in, woohoo!
class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available in dock' if empty?

    @bikes.pop
  end

  def dock(bike)
    raise 'Docking station is full' if full?

    @bikes << bike
  end

  private

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.count <= 0
  end
end
