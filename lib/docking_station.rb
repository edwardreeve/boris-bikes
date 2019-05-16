require_relative 'bike.rb'

# A docking station to store bikes in, woohoo!
class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available in dock' if empty?
    raise 'Sorry, this bike is broken' if bikes.last.working == false

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
    bikes.empty?
  end
end
