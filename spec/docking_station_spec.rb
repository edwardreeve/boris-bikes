require 'docking_station.rb'

describe DockingStation do
  let(:my_dock) { DockingStation.new }

  it { should respond_to :release_bike }

  it 'should release a working bike' do
    bike = double(:bike)
    my_dock.dock(bike)
    returned_bike = my_dock.release_bike
    expect(returned_bike.working).to eq(true)
  end

  it { should respond_to(:dock).with(1).argument }

  it { should respond_to :bikes }

  it 'should store a bike that\'s been docked' do
    bike = double(:bike)
    my_dock.dock(bike)
    expect(my_dock.bikes).to eq([bike])
  end

  it 'should not release_bike if empty' do
    expect { my_dock.release_bike }.to raise_error('No bikes available in dock')
  end

  it 'should not accept bike if at capacity' do
    DockingStation::DEFAULT_CAPACITY.times { my_dock.dock(double(:bike)) }
    expect { my_dock.dock(double(:bike)) }.to raise_error('Docking station is full')
  end

  it 'should accept a capacity instance variable when created' do
    ds = DockingStation.new(30)
    expect(ds.capacity).to eq(30)
  end

  it 'should have a capacity of 20 unless otherwise specified' do
    expect(my_dock.capacity).to eq(20)
  end

  it 'should not release broken bikes' do
    broken_bike = double(:bike)
    broken_bike.broken
    my_dock.dock(broken_bike)
    expect { my_dock.release_bike }.to raise_error('Sorry, this bike is broken')
  end
end
